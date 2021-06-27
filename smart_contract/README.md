# Smart Contract

In this folder you will find the following documents:

+ **Blockchain and Security Tokens**
  + This document provides information regarding what blockchain is and its use cases, what a smart contract is and how to interact with it, security tokens, their benefits and general requirements that one must take into consideration when designing one. Please read this first for context of the Design History in the Reports folder, as well as for the Token Technical Documentation.

+ **Token Technical Documentation**
  + Here you will find in depth documentation as to all the states, wallet variables, functions and permissions regarding the smart contract. Please read Design History in the Reports folder in order to gain understanding as to the reasoning for some specific design choices in this document.

+ **token_smart_contract.sol**
  + This is the Solidity file containing the code for the smart contract.

+ **MNEX Demo (Compressed)**
  + This is the video demonstrating and explaining the basic functionality of the smart contract.

+ **smart_contract_tests.xlsx**
  + This is a document describing the results of all tests performed on the smart contract.


# Using the Smart Contract
In order to test the smart contract, use Remix Solidity in-browser compiler.

(If you have never dealt with Solidity or Ethereum before, use the start of this tutorial to help understanding how to use the compiler: https://www.youtube.com/watch?v=ipwxYa-F1uY)

In order to test the contract:
- Deploy the contract with one account (using the Javascript VM environment)
- Only that account will be able to use the mintNewTokens() function (as well as any other MinexxOnly permissioned functions)
- Add the key for a second account to the whitelist (choose from the drop down account list at the top)
- Then switch to that second account 
- Then if you fill the 'value' field (just above deploy) with any non-zero number of Ether, then click the buyTokens function, the account will be credited with a balance of that many tokens
- This can be checked by setting the two accounts used into the "testown" and "testbuyer" variables at the bottom of the contract code before deployment, then using the displayTestBalances() function
- Interest rate (defualt is 0) can only be set by the same account that initially deployed the contract (hence Minexx)


