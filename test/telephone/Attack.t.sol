// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {Attack} from "src/telephone/Attack.sol";
import {Telephone} from "src/telephone/Telephone.sol";

contract AttackTest is Test {
    Attack attackContract;
    Telephone telephone;
    address owner1 = makeAddr("owner1");
    address attacker = makeAddr("attacker");

    function setUp() public {
        vm.prank(owner1);
        telephone = new Telephone();
        vm.prank(attacker);
        attackContract = new Attack(address(telephone));
    }

    function testAttackWorks() public {
        address priorOwner = telephone.owner();
        vm.prank(attacker);
        attackContract.changeOwner();
        address postOwner = telephone.owner();
        assertEq(priorOwner, owner1);
        assertEq(postOwner, attacker);
    }
}
