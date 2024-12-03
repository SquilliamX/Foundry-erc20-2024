// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    // since the ERC20 contract we inherited from has a constructor, we must implement the constructor.
    constructor(uint256 initalSupply) ERC20("OurToken", "OT") {
        // mint the msg.sender of this contract the entire initial Supply
        _mint(msg.sender, initalSupply);
    }
}
