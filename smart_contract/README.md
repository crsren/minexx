# minexx test
If you want to take a look/ test the smart contract, use Remix Solidity in-browser compiler

I used this tutorial to get me started: https://www.youtube.com/watch?v=ipwxYa-F1uY
- don't feel like you have to, more just if you want to get an idea of how the smart contract works

If you do that and want to test it:
- Deploy the contract with one account (with Javascript VM)
- Only that account will be able to use the mintNewTokens() function
- Then switch to another account (via the drop down account list at the top)
- Then if you fill the 'value' field (just above deploy) with any non-zero number of Ether, then click the buyTokens function, the account will be credited with a balance of that many tokens
- This can be checked by putting that account's address into the 'accounts' function
- Interest rate (defualt is 0) can only be set by the same account that initially deployed the contract (hence Minexx)


NOTES
- Currently there is no time restriction on the interest rate payments, I'll do that next
- Also all numebrs are currently integers - Solidity natively only uses ints, need to import a library to get floating numbers - I'll do this as well
- Also need to add functionality to the transfer function so it transfers any interest attatched to the tokens being transferred
