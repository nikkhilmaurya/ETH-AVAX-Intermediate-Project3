// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    // State variable to store the administrator's address
    address public admin;

    // Modifier to restrict access to admin-only functions
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can execute this function");
        _;
    }

    // Constructor to initialize the token with a name and symbol, and set the admin
    constructor(string memory tokenName, string memory tokenSymbol) ERC20(tokenName, tokenSymbol) {
        admin = msg.sender;
    }

    // Function to mint new tokens, restricted to admin
    function mintTokens(address recipient, uint256 amount) external onlyAdmin {
        _mint(recipient, amount);
    }

    // Function to burn tokens from the caller's account
    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Function to transfer tokens, overriding the ERC20 transfer function
    function sendTokens(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    // Function to update the admin address
    function updateAdmin(address newAdmin) external onlyAdmin {
        require(newAdmin != address(0), "Invalid address");
        admin = newAdmin;
    }

    // Function to get the current admin address
    function getAdmin() external view returns (address) {
        return admin;
    }
}
