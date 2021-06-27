
# Blockchain

Blockchain is a technology that implements a specific type of database, storing data in blocks which are then chained together. The blockchain is stored on a network of peer-to-peer computers, which can often be scattered across the world. This means that a blockchain is decentralized and distributed, compared to a centralized network such as the banking payment system. A specific blockchain platform can either fall into the categories of public or private - a public blockchain maintains a distributed ledger that has its history available to view for all participants, whereas for a private one this is not the case. 

Data within the blockchain is stored as transactions, which are grouped into blocks, and then cryptographic hashes are used along with timestamps in order to link these blocks together so that they maintain chronological order [1]. 

Due to the distributed nature of these ledgers, there must be some type of consensus mechanism in order to have all the participants, each of which is called a “node”, agree on the correct blockchain history. There are a number of these consensus algorithms, and different blockchain platforms use different types. Certain nodes on the network are called “validators”, and perform the consensus algorithm functions, ensuring the network's ledger remains immutable and secure, which keeps the blockchain safe from falsified information and hacks. These validators tend to be rewarded for this role through a portion of the transaction fees on the network [2]. 

The benefits of blockchain technology include immutability, security and transparency of the transaction history. Decentralization of data storage also ensures that data can always be recovered when lost on one node. For these reasons there are many use cases for blockchain technology, the largest currently being for a decentralized currency system - cryptocurrencies. They offer some advantages such as the ability to process payments, as well as easy access to free financial accounts (in the form of digital wallets), in both cases removing the need for third party intermediaries. This can be particularly useful for citizens of developing countries, where it can sometimes be hard to get access to centralized bank accounts.

Blockchain can also be used by businesses, in order to benefit from similar features. Traditionally paper-heavy processes can be made faster and more efficient through the removal of intermediaries, as well as the ability for blockchain to store documents along with transaction details. Hence there is no need to manually align multiple companies’ ledgers. The use cases for the technology within industries range from supply chain traceability[3] to automatic underwriting and claims settlement in insurance[4]. The automation of business processes on a blockchain is achieved through the use of “smart contracts” on certain blockchain platforms.

**Smart Contracts**

Smart contracts are programs stored on a blockchain platform that can either be interacted with directly, or run automatically when predetermined conditions are met. The automatic execution of agreements between participants means that everyone can be certain of the outcome of the agreement, without any intermediary company’s involvement. This is due to the fact that the terms of the contract between the parties is written directly into lines of code.

Every interaction with a smart contract is recorded on the blockchain as a transaction. The most widely used blockchain platform that uses smart contracts is called Ethereum. In order to use a coded smart contract, it first must be deployed to a blockchain on which it’ll be used. At this point it is assigned an Ethereum address, at which it can be accessed by other accounts [5].

 \
**Gas Costs**

Every single transaction that is used to interact with a smart contract deployed on a blockchain incurs a transaction fee. These transaction fees vary both with the complexity of the transaction taking place, as well as the volume of transactions being made at that point in time on the network. This is due to the fact that there is limited space within each block for the number of transactions that can be recorded. 

Miners and validators are rewarded with these transaction fees.  On Ethereum, these transaction fees are paid in a unit called gas. These are priced in a subunit of Ether, called Gwei, which are equal to 1x10<sup>-9</sup> Eth. The more complex a transaction is, the more space that transaction takes up in a block when recorded on the blockchain - for this reason, more complex transactions require higher gas fees in order to complete [6].

When creating a transaction by interacting with a smart contract, the transaction sender has choice as to how much gas they are willing to pay. As a result of supply and demand, miners are incentivised to accept transactions at higher gas fees [7]. Choosing to pay lower gas fees means your transaction is more likely to take longer to complete, and may even get dropped (and therefore not recorded on the blockchain) at times of high network volume. 

For the reasons  explained above, there is a tradeoff with the cost willing to be paid for the transaction, the complexity of the transaction and the probability that the transaction will be finalized. 

# Security Tokens

Security tokens are a type of crypto asset implemented using blockchain technology. They are a type of tokenized contract for any asset that has real-world value, such as real estate or equity as shares in a company. A particular asset can be divided into many fractions, with each security token representing a certain portion of that asset. For example, retail investors who may not have the capital to purchase a whole property, can still gain exposure to the asset through purchasing a security token issued by a certain company offering this. 

Security tokens can be said to “tokenize” traditional financial securities. Investors in the tokens can be assured that their ownership is recorded on the blockchain ledger that the security token is issued on, rather than a custodian or intermediary holding this information privately [8]. 

In our case, the security token designed will represent a traditional debt instrument. A token represents a portion of the debt loaned out by the fund, entitling the owner to interest payments collected by the Artisanal Transformational Impact Fund.

The market size for security tokens is growing rapidly, and as more and more interest is drawn into the security token space, more and more investments will be made in it, putting Minexx in the perfect place for implementing their own now. The security token market capitalization grew by over 500% [9] in 2020, and is estimated to grow by much more in the coming years. This will drive more and more interest to Minexx’s security token, allowing them to quickly grow the ATIF. 

**Benefits**

Security tokens present a number of advantages over traditional financial vehicles. Our specific token demonstrates the following benefits compared to a standard micro-investment fund [10]:



1. **Security tokens offer greater liquidity compared to traditional securities** 
*   Frictionless transfer of the security between parties helps the market be more liquid, as this enables the removal of intermediaries that are necessary for the transfer of traditional securities.
2. **Security tokens enable more efficient and cost-effective transfers of fractional ownership in real-world assets**
*   Fractional interest in real-world assets require time-consuming and expensive processes, usually carried out by some intermediary like a custodian, in order to maintain correct ownership of assets and conduct valid transfers.
*   Smart contracts, when combined with the greater liquidity in the tokens as described above, allow much more efficient and cost-effective transfer of the assets.
3. **Security tokens allow for improved investor management**
*   The smart contract managing the balances of the individual accounts automatically updates the list of addresses holding tokens whenever a transfer is made. 
4. **Security tokens facilitate automatic interest payments**
*   Security tokens have the advantage that interest/dividend payments can be coded directly into the smart contract, ensuring that they happen periodically and on time.
*   This is a huge improvement on the current system, especially in dividend payments, where payments are sometimes sent by cheques in the mail. The concept of interest payments for a security token is similar to that of dividend payments. 
*   An added benefit is that investors can transfer tokens while they still have interest being accrued on them, and that interest being accrued will seamlessly be added to the interest being accrued in the recipient’s account. This is much more difficult to do with traditional interest bearing investments.
5. **Security tokens ensure greater compliance with laws**
*   Highly complex laws and regulations around the world can be difficult to navigate when dealing with securities. Some types of securities allow secondary trading, some require a certain amount of time to pass before it is allowed. Others put limits on who can sell securities and how much.
*   Regulatory compliant rules can be coded directly into the smart contract of a token, guaranteeing that the issuer won’t be flagged by regulatory bodies in the future for potential mistakes. 

**General Requirements**

In order for the designed security token to meet its functional requirements, it must also be valid as a traditional security. To do this, it must take regulations into account for every country in which it is offered. There are a number of variations in the regulatory laws regarding securities in different countries, however there are some that have aspects that are shared in almost every country.

The most basic of these shared laws is linked to knowing the identity of all investors that may own the security token. These rules are generalized to the names “Know Your Customer” and “Anti-Money Laundering” (AML/KYC) laws [11]. In order to be compliant with them, token (or security) issuers must have completed identity checks on all potential investors, which includes verifying that their personal identity documents agree with who they say they are.

This can become complicated when dealing with public blockchains, which by nature are accessible by anyone, as their decentralized and permissionless characteristics mean anyone can set up a node on their network. If there are no specific restrictions placed within the smart contract, this means that even if an issuer goes through the correct processes to identify an address that expresses interest in purchasing their token, if it is then sent to an unverified address, they will be breaking these AML/KYC laws, and will be subject to fines and/or legal action. This means that there needs to be some method in which the token is designed in order to limit the range of investors that can access the token. 

---

**References**

[1] [Bitcoin: A Peer-to-Peer Electronic Cash System](https://bitcoin.org/bitcoin.pdf)

[2] [Binance -  What Are Blockchain Transaction Fees?](https://academy.binance.com/en/articles/what-are-blockchain-transaction-fees)

[3] [IBM Blockchain Services for Supply Chain](https://www.ibm.com/downloads/cas/APGWOG5A)

[4] [Transforming insurance management with IBM Blockchain](https://www.ibm.com/downloads/cas/OMJRXZAL)

[5] [Ethereum - Deploying Smart Contracts](https://ethereum.org/en/developers/docs/smart-contracts/deploying/)

[6] [Ethereum - Gas and Fees](https://ethereum.org/en/developers/docs/gas/#:~:text=As%20dapp%20functionality%20grows%20more,%2Dbid%20other%20users'%20transactions)

[7] [Foundation - What is Gas? Why does the price fluctuate?](https://help.foundation.app/en/articles/5104111-what-is-gas-why-does-the-price-fluctuate)

[8] [Investopedia - Security Tokens](https://www.investopedia.com/tech/2018-year-security-token/)

[9] [Forbes - Security Token Industry 2021] (https://www.forbes.com/sites/nisaamoils/2021/01/25/security-token-industry-in-2021/?sh=3189f2ec61cb) 

[10] [The Block Crypto - Security Token Misconceptions and Benefits](https://www.theblockcrypto.com/post/16059/security-tokens-misconceptions-and-benefits)

[11] [Blockpass - KYC for Token Offerings](https://www.blockpass.org/kyc-for-token-offerings/)


