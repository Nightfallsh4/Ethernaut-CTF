// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {Force} from "src/force/Force.sol";
import {Attack} from "src/force/Attack.sol";

contract AttackTest is Test{
    Force private force;
    Attack private attack;
    address owner1 = makeAddr("owner1");
    address attacker = makeAddr("attacker");

     function setUp() public {
        vm.prank(owner1);
        force = new Force();
        vm.prank(attacker);
        attack = new Attack(address(force));
    }

    function testSendEthNormally()  public {
        hoax(attacker, 10 ether);
        (bool success,) = payable(address(force)).call{value:1 ether}("");
        assertEq(success, true);
    }

    function testSendThroughSelfDestruct() public {
        hoax(attacker, 10 ether);
        (bool success,) = payable(address(attack)).call{value:1 ether}("");
        assertEq(success, true);
        uint256 balanceBeforeAttack = address(force).balance;
        vm.startPrank(attacker);
        attack.attack();
        vm.stopPrank();
        uint256 balanceAfterAttack = address(force).balance;
        assertEq(balanceAfterAttack,1 ether);
        assertEq(balanceBeforeAttack, 0);
    }
}