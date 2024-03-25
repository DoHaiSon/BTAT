// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC777/ERC777.sol";

contract ERC777Token is ERC777 {
    constructor(uint256 initialSupply, address[] memory defaultOperators)
        ERC777("ERC777Token", "Token", defaultOperators)
    {
        _mint(msg.sender, initialSupply, "", "");
    }
}