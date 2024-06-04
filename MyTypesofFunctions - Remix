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
