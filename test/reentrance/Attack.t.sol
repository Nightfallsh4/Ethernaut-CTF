// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "forge-std/Test.sol";
import {Reentrance} from "src/reentrance/Reentrance.sol";
import {Attack} from "src/reentrance/Attack.sol";

contract AttackTest is Test {
    Reentrance private reentrance;
    Attack private attack;
    address owner1 = makeAddr("owner1");
    address attacker = makeAddr("attacker");


    function setUp() public  {
        vm.prank(owner1);
        reentrance = new Reentrance();
        vm.prank(attacker);
        attack = new Attack(address(reentrance));
        (bool success, ) = payable(address(reentrance)).call{value: 0.001 ether}("");
        if (!success) {
            require(success,"setup not success");
        }
    }

    function testAttackReentrance() external {
        hoax(attacker,10 ether);
        attack.attack{value:0.0005 ether}();
        uint256 postAttackBalance = address(reentrance).balance;
        assertEq(postAttackBalance, 0);
    }
}