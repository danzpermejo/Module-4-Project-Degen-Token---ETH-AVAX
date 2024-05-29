# Module 4 | Project: Degen Token (ERC-20)

The purpose of this program is to create a virtual currency called DegenCoin on the Avalanche network. This currency can be used within a game (presumably called Degen Gaming).  The program allows the game administrators (owners) to mint new coins, users to transfer coins between themselves, and burn unwanted coins. There's also a function to redeem coins for in-game items, but the details of how that works would be handled separately by the game itself.

## Description

This program acts as a blueprint for a virtual currency called DegenCoin on the Avalanche blockchain. Imagine it as a digital token for a game, possibly Degen Gaming. The program allows the game's administrators, who own the contract, to create new DegenCoins. Players can then trade these coins with each other or even get rid of unwanted ones by burning them. There's also a feature to redeem DegenCoins for in-game goodies, but how exactly that works would be handled within the game itself. This program sets the foundation for the DegenCoin economy within the game.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenCoin is ERC20 {
    address public owner;

    // Event to log the redemption of tokens for an item
    event Redeemed(address indexed from, uint256 amount, uint256 indexed itemId);

    constructor(uint256 initialSupply, string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
        owner = msg.sender;
    }

    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can mint");
        _;
    }

    // Function to mint new tokens, only the owner can call this
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Transfer function 
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    // Function to burn tokens 
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function to redeem tokens
    function redeem(uint256 amount, uint256 itemId) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to redeem");

        
        _burn(msg.sender, amount);

        
        emit Redeemed(msg.sender, amount, itemId);

        
    }

    // Function to check the balance of tokens
    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.25" (or another compatible version), and then click on the "MyTypeofFunctions-ETH+AVAX" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyTypeofFunctions-ETH+AVAX" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by input your desired tokens and explore some of that functionality like Minting, Transferring, Redeeming tokens. Also you can check the token balance and burning tokens.

## Authors

Danz Andrew M. Permeo (61903258)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
