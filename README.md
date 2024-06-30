# ETH-AVAX-Intermediate-Project3

This Solidity program includes a simple contract which provides an implementation of smart contract using ERC20 roken.

## Description

This Solidity contract implements a simple ERC20 token with administrative functionalities. It includes features such as minting new tokens, burning existing tokens, and transferring tokens. The contract owner (admin) has exclusive rights to mint new tokens and update the admin address. This contract provides a foundational example for understanding ERC20 token implementation and administrative controls in Solidity smart contracts.

### Prerequisites

- Access to a web browser
- Internet connection
  
## Getting Started

### Executing program

1. To run this program, we can use Remix at https://remix.ethereum.org/.
2. Create a new file by clicking on the "+" icon in the left-hand sidebar.
3. Save the file with a .sol extension 

```javascript
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

```

Compile the code. Once compiled,

1. Go to the 'Deploy & Run Transactions' tab on the left.
2. Click on Deploy.

After deploying, we can interact with the contract. 

## Authors

Nikhil Maurya


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
