# Module 4 | Project: Degen Token (ERC-20)

My DegenToken smart contract appears to be designed for a merchandise store. It creates a token named "Degen" (DGN) that users can acquire from the contract owner and spend to redeem items like hoodies and backpacks. The contract keeps track of how many of each item a user has purchased and ensures they have enough DGN tokens before allowing a redemption. Overall, this smart contract functions like a digital currency system for a merchandise store.

## Description

This Solidity smart contract functions like an internal token system for a digital merchandise store. It creates a custom token named "Degen" (DGN) that can be minted by the store owner and used by customers to purchase items. The contract manages a list of purchasable items like hoodies and backpacks, along with their set prices in DGN tokens. Customers can spend their DGN tokens to redeem these items, with the contract ensuring they have sufficient balance before completing the purchase. The contract also keeps track of a user's redemption history, recording how many of each item they've acquired. This allows users to view both the available merchandise and their own purchase history within the store.

### Functions of Smart Contract
1. Mint Tokens ( onlyOwner ): This function allows the contract owner (deployer) to mint new DGN tokens and distribute them as needed.
2. Burn Tokens: This function allows users to burn their own DGN tokens, effectively removing them from circulation.
3. Get All Items: This function retrieves a list of all available items and their corresponding prices in DGN tokens.
4. Redeem Item: This function allows users to spend their DGN tokens to redeem a specific item from the store. The contract checks the user's balance and burns the required amount of DGN tokens upon successful redemption.
5. Get Redeemed Items: This function allows users to view their redemption history, displaying how many of each item they have redeemed so far.
6. Transferring tokens: Users will be able to transfer their tokens to others.
7. Checking token balance: Users will be able to check their token balance at any time.

## Authors

Danz Andrew M. Permeo (61903258@ntc.edu.ph)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
