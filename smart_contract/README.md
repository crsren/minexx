



# Using the Smart Contract
In order to test the smart contract, use Remix Solidity in-browser compiler.

Use this tutorial to get yourself started as to how to use the compiler (if you have never used a smart contract compiler before): https://www.youtube.com/watch?v=ipwxYa-F1uY

In order to test the contract:
- Deploy the contract with one account (using the Javascript VM environment)
- Only that account will be able to use the mintNewTokens() function (as well as any other MinexxOnly permissioned functions)
- Add the key for a second account to the whitelist (choose from the drop down account list at the top)
- Then switch to that second account 
- Then if you fill the 'value' field (just above deploy) with any non-zero number of Ether, then click the buyTokens function, the account will be credited with a balance of that many tokens
- This can be checked by setting the two accounts used into the "testown" and "testbuyer" variables at the bottom of the contract code, then using the displayTestBalances function
- Interest rate (defualt is 0) can only be set by the same account that initially deployed the contract (hence Minexx)


