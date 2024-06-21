// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    
    mapping (string => uint256) public itemPrices;

    string[] private itemNames;

    mapping (address => mapping(string => uint256)) public redeemedItems;

    
    event TokensMinted(address indexed to, uint256 amount);
    
    event ItemRedeemed(address indexed by, string itemName, uint256 itemPrice, uint256 itemCount);
    
    event TokensBurned(address indexed from, uint256 amount);

    
    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        
        itemPrices["hoodie"] = 700;
        itemPrices["bagpack"] = 450;
        itemPrices["af1"] = 1200;
        itemPrices["shorts"] = 599;
        itemPrices["eyeglasses"] = 300;
        
        
        itemNames.push("hoodie");
        itemNames.push("bagpack");
        itemNames.push("af1");
        itemNames.push("shorts");
        itemNames.push("eyeglasses");
    }

    
    function getAllItems() public view returns (string[] memory, uint256[] memory) {
        uint256[] memory prices = new uint256[](itemNames.length);
        for (uint256 i = 0; i < itemNames.length; i++) {
            prices[i] = itemPrices[itemNames[i]];
        }
        return (itemNames, prices);
    }

    
    function mintTokens(address to, uint256 amount) external onlyOwner {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than zero");

        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    
    function redeemItem(string memory itemName) external {
        uint256 itemPrice = itemPrices[itemName];
        require(itemPrice > 0, "Item not in the list");
        require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance");

        _burn(msg.sender, itemPrice);
        redeemedItems[msg.sender][itemName] += 1;  
        emit ItemRedeemed(msg.sender, itemName, itemPrice, redeemedItems[msg.sender][itemName]);
    }

    
    function burnTokens(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

    
    function getRedeemedItems(address user) external view returns (string[] memory, uint256[] memory) {
        uint256[] memory itemCounts = new uint256[](itemNames.length);
        for (uint256 i = 0; i < itemNames.length; i++) {
            itemCounts[i] = redeemedItems[user][itemNames[i]];
        }
        return (itemNames, itemCounts);
    }
}
