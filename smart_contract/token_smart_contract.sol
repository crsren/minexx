pragma solidity ^0.8.4;

contract MNEXTok {
    
     struct wallet {
         //in order to get from value stored to $ value, divide by 1000 (due to 4dp precision)
         //numbers must be converted back when displaying on web page 
         
        uint256 balance; 
        uint256 interestAccrued;
        uint256 interestBalance;
        
        //mapping (uint256 => uint256) valuePurchasedList; // buyCount to value 
        //mapping (uint256 => uint256) timePurchasedList; // buyCount to timestamp of purchase
        //uint256 buyCount;
        //uint256 claimedCount;
        
        uint256 buyTime;
        bool interestCalculated;
        bool interestClaimable;
        
        bool accountFrozen;
    }
    
    //Mappings stored by smart contract
    mapping (address => bool) public whitelistedInvestors;
    mapping (address => bool) public RegulatoryBodies;
    mapping(address => wallet) accounts; //declare this as public if you want to see the value in certain accounts from the compiler when debugging/testing
    
        
    address payable Minexx; 
    uint256 public monthlyInterestRate;
    
    //Token supply values
    uint256 public tokensAvailable;
    uint256 totalTokenSupply;
    
    uint32 MONTH_IN_SECONDS = 60;
    
    
    constructor() payable {//deployed with the Minexx address
        Minexx = payable(msg.sender); //owner is the account that deploys the smart contract (so MINEXX)
    }
    
    event NewTokensMinted(
        uint32 _amount
    );
    
    function addToWhitelist(address newAddress) public onlyMinexx{
        whitelistedInvestors[newAddress] = true;
    }
    
    function addToRegBods(address newRegulator) public onlyMinexx{
        RegulatoryBodies[newRegulator] = true;
    }
    
    function mintNewTokens(uint32 valueMinted) public onlyMinexx {
        //function for minting new tokens for new funding rounds

        accounts[Minexx].balance += valueMinted*10000;
        tokensAvailable = accounts[Minexx].balance;
        totalTokenSupply += valueMinted*10000;
        emit NewTokensMinted(valueMinted);
    }
    
    function setInterestRate(uint256 _interestRate) public onlyMinexx{
        //function for setting interest rate from Minexx platform
        //currently gotten from parameter to function 
        //in the future could grab straight from Minexx platform 
        
        //due to the 4dp precicion and solidity only supporting uint, multiply interest rate by 10000
        //example:
        // 3.75% interest --> 1.0375
        //1.0375* 10000 = 10375, leaving no decimal places
        //this calculation could be managed by the UI Minexx uses to interact with the smart contract, so Minexx can directly enter the % interest
        monthlyInterestRate = _interestRate;
    }
    
     
    function buyToken() public payable notFrozen{ //payable keyord allows the function to accept ether - also used when defining or passing the wallet 
        //(pretending that 1 Eth sent as pament = $1, in reality Eth wouldn't be sent)
        //send the money to the Minexx account
        require(whitelistedInvestors[msg.sender]==true, "Your address is not whitelisted, please complete KYC/AML checkswith Minexx before attempting purchase." );
        
        uint256 tokensToBuy = msg.value/(10**18); //this calculation is only needed for the Ether payment (as solidity base unit for the currency is wei)
        
        tokensToBuy = tokensToBuy * 10000; //this calculation is explained in setInterestRate
        
        //if money sent is >0 and there is enough balance in the Minexx account:
        require(tokensToBuy>0, "No capital has been sent to buy tokens with.");
        require(accounts[Minexx].balance >= tokensToBuy, "There are not enough tokens available for purchase, please re-check the token count available and decrease your purchase amount");
        Minexx.transfer(msg.value); //send Ether from transaction to Minexx wallet 
        
        //send the security token from the Minexx account to the buyer's
        accounts[msg.sender].balance += tokensToBuy;
        accounts[Minexx].balance -= tokensToBuy;
        tokensAvailable = accounts[Minexx].balance;
        
        //update buyTime and interest values
        accounts[msg.sender].buyTime = block.timestamp; 
        accounts[msg.sender].interestCalculated = false;
        accounts[msg.sender].interestClaimable = false;
        
    }
    
    function checkIfClaimable() public notFrozen returns (bool Claimable)  {
        bool isClaimable = (block.timestamp > (accounts[msg.sender].buyTime + MONTH_IN_SECONDS ));
        
        if (isClaimable){
            accounts[msg.sender].interestClaimable = true;
        }
        return isClaimable;
    }
    
    function calculateInterestOwed() public notFrozen{ 
        //calculates interest owed based on account balance, interest rate an time it's been since purchase
        require(!accounts[msg.sender].interestCalculated); //ADD COMMENT FOR REJECTION
        accounts[msg.sender].interestAccrued += accounts[msg.sender].balance * (monthlyInterestRate-10000); //interest is in form 3% = 1.03*10000, hence subtract 10000
        accounts[msg.sender].interestCalculated = true;
    }
    
    function claimInterest() public notFrozen{ 
        //gets interest from interestAccrued into interestBalance
        require(accounts[msg.sender].interestAccrued>0,"Your interest accrued value is currently 0, press calculateInterestAccrued to find out how much you have accrued.");
        require(accounts[msg.sender].interestClaimable, "The interest holding period has not passed, please wait until your interest claimable date to claim owed interest.");
        accounts[msg.sender].interestBalance += accounts[msg.sender].interestAccrued;
        accounts[msg.sender].interestAccrued = 0;
        accounts[msg.sender].interestClaimable = false;
    }
    
     function transfer(address receiver, uint32 value) public notFrozen {
         
        require(whitelistedInvestors[receiver]==true, "Receiver's address is not whitelisted, please have them complete KYC/AML checks with Minexx before attempting transfer." );
        require(accounts[receiver].accountFrozen == false, "Recipient's assets have been frozen by a regulatory body, they cannot receive tokens."); //must also check that recipient's account is not frozen

        accounts[receiver].balance += value;
        accounts[msg.sender].balance -= value;
        
         //calculation for how much interest accrued to send along with token, if not claimed yet:
        uint256 interestChange =  (value*accounts[msg.sender].interestAccrued)/ accounts[msg.sender].balance;

        //transfer interest owed
        accounts[receiver].interestAccrued+= interestChange;
        accounts[msg.sender].interestAccrued-= interestChange;
        
        //update newClaimableDate with later claimable date out of receiver and sender
        uint256 newClaimableDate;
        if (accounts[receiver].buyTime > accounts[msg.sender].buyTime){
            newClaimableDate = accounts[receiver].buyTime;
        }
        else{
            newClaimableDate = accounts[msg.sender].buyTime;
        }
        accounts[receiver].buyTime = newClaimableDate;
        
        
    }
    
    //MODIFIERS
    
    modifier onlyMinexx(){
        require(msg.sender == Minexx, "Sender not authorized for this action."); //msg is function metadata passed in  - sender is the address that called the function
        _;
    }
    
    modifier notFrozen(){
        require(accounts[msg.sender].accountFrozen == false, "Your assets have been frozen by a regulatory body.");
        _;
    }
    
    
    //parts for testing - used in the video demonstration
    address testown = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address testbuyer = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    
    function displayTestBalances() public view returns (uint256 MinexxAccount, uint256 BuyerAccount, uint256 InterestAccrued, uint256 InterestBalance, bool Interest_Claimable){
        //divide by 10000 to get rough $ value (doesn't do decimal points)
        MinexxAccount = accounts[Minexx].balance/10000;
        BuyerAccount = accounts[testbuyer].balance/10000;
        
        InterestAccrued = accounts[testbuyer].interestAccrued/(10000*10000);
        InterestBalance = accounts[testbuyer].interestBalance/(10000*10000);
        Interest_Claimable = accounts[testbuyer].interestClaimable;
    }
  
 
 
}
