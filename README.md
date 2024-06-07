# Module 4 | Project: Degen Token (ERC-20)

My DegenToken smart contract establishes a marketplace system built on top of an ERC20 token named "Degen" (DGN). The ERC20 functionality allows users to transfer, check their balance, and the owner to mint or burn tokens. The marketplace aspect is achieved through functionalities for listing items (only by the owner), creating trade offers for listed items, and redeeming those items by burning DGN tokens. The contract tracks trade offers and keeps a record of completed trades and item redemptions through events. Additionally, users can view specific trade details and their DGN token balance. Overall, this smart contract design facilitates a tokenized marketplace where users can interact by buying and selling items using the DGN token.

## Description

The DegenToken smart contract is an ERC20-compliant token built using the OpenZeppelin library, inheriting functionalities from both ERC20 and Ownable contracts. Named "Degen" with the symbol "DGN", it allows the contract owner to mint new tokens and users to burn their tokens. The contract also facilitates a marketplace for trading items represented by strings. Items can be listed by the owner with a specified quantity and price. Users can create trades, specifying the item name, quantity, and price, which are stored in a mapping and assigned a unique trade ID. Trades can be completed if the buyer has sufficient token balance, transferring tokens from the buyer to the seller and emitting corresponding events. The contract includes functionalities for redeeming items by burning tokens equivalent to the item’s price, listing new items, and querying trades and balances. This smart contract promotes decentralized trading and token utility within its ecosystem.

### Functions of Smart Contract
1. ERC20 token (Degen - DGN):
   - The contract inherits from OpenZeppelin's ERC20 implementation, enabling functionalities like transfers, balance checks, and token minting/burning.
   - The constructor defines the token name as "Degen" and symbol as "DGN".
2. Ownership:
   - By inheriting from Ownable, the contract grants control to a single owner address.
   - This owner has the privilege to mint new tokens and burn existing ones.
3. Marketplace System:
   - Two mappings manage item and trade data:
     - items: Stores details (quantity and price) for redeemable items. Only the owner can add items using listItem.
     - trades: Stores information on user-created trade offers.
4. Users can create trade offers (createTrade) specifying the item name, quantity, and price.
5. A tradeCounter generates unique IDs for each trade offer.
6. Users can redeem items (redeem) by burning the required DGN tokens based on the listed item price.
7. The completeTrade function allows users to accept a trade offer, burning their DGN and transferring them to the seller in exchange for the redeemed item.
8. Events track actions:
   - ItemTraded: Records trade completions.
   - TradeCreated: Logs new trade offer creations.
   - ItemRedeemed: Indicates item redemptions by users.
9. getTrade: Allows retrieving details of a specific trade offer.
10. CheckTheBalance: Enables users to check their DGN token balance.


## Authors

Danz Andrew M. Permeo (61903258@ntc.edu.ph)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
