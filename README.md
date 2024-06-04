# Module 4 | Project: Degen Token (ERC-20)

This smart contract defines a token called GameCoin (GCN) that can be used in an in-game store. Players can acquire GameCoins (likely through separate minting mechanisms) and then spend them using the redeem function to purchase items listed by the game owner (with listItem). The contract ensures players have sufficient tokens and manages item quantities to prevent overselling. Overall, it creates a system for players to spend their GameCoins on in-game items.

## Description

This smart contract creates a secure marketplace within a game, functioning with a custom token called GameCoin (GCN). Players can acquire these tokens (likely through external mechanisms) and then spend them in an in-game store managed by the game owner. The store offers purchasable items, with the contract ensuring a fair exchange by verifying player funds, maintaining item stock, and burning spent tokens. This system allows players to manage their GameCoins and use them to acquire valuable in-game items.
## Getting Started

### Functions of Smart Contract - GameCoin
1. Minting New Tokens - Only owner can mint token 
2. Transferring Tokens - Any players can transfer their tokens
3. Redeeming Tokens - Players can definitely use their tokens in exchange for items in a game store setting
4. Checking Token balance - Players will able to check their token balance
5. Burning Tokens - Anyone can be able to burn tokens
6. Listing an Item - The owner can list an item in-game store

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameCoin is ERC20, Ownable {
    event ItemRedeemed(address indexed redeemer, string item, uint256 quantity);

    struct Item {
        uint256 quantity;
        uint256 price;
    }

    mapping(string => Item) public items;

    constructor(address initialOwner) Ownable(initialOwner) ERC20("GameCoin", "GCN") {}

    // Minting new tokens
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Burning tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Redeeming tokens
    function redeem(string memory itemName, uint256 quantity) external {
        Item storage item = items[itemName];
        require(item.quantity >= quantity, "Not enough item quantity");
        uint256 cost = item.price * quantity;
        require(balanceOf(msg.sender) >= cost, "Insufficient token balance");
        _burn(msg.sender, cost);
        item.quantity -= quantity;
        emit ItemRedeemed(msg.sender, itemName, quantity);
    }

    // List an item in the in-game store
    function listItem(string memory itemName, uint256 quantity, uint256 price) external onlyOwner {
        items[itemName] = Item({
            quantity: quantity,
            price: price
        });
    }

    // Checking token balance
    function checkTheBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }
}



```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.25" (or another compatible version), and then click on the "DegenToken" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DegenToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by input your desired tokens and explore some of that functionality like Minting, Transferring, Redeeming tokens. Also you can check the token balance and burning tokens.

## Authors

Danz Andrew M. Permeo (61903258)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
