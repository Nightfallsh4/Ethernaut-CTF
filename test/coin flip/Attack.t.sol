// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

import "forge-std/Test.sol"; 
import {Attack} from "src/coin flip/Attack.sol";
import {CoinFlip} from "src/coin flip/CoinFlip.sol";

contract AttackTest is Test { 
	
    Attack attackContract;
    CoinFlip coinFlipContract;
    address owner = makeAddr("owner");

	function setUp() public { 
        coinFlipContract = new CoinFlip();
        attackContract = new Attack(address(coinFlipContract), owner);
	} 

    function testAttackWorks() public {
        uint256 priorWins = coinFlipContract.consecutiveWins();
        vm.prank(owner);
        attackContract.attack();
        uint256 postWins = coinFlipContract.consecutiveWins();
        assertEq(postWins, priorWins+1);
    }
	
}