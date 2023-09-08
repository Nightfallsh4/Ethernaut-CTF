// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {Attack} from "src/force/Attack.sol";

contract DeployAttack is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address ownerAddress = vm.addr(deployerPrivateKey);
        address forceAddress = 0x002d845aa24Fd23a9C0176688c7a1e7f05Cc599C;
        vm.startBroadcast(deployerPrivateKey);
        new Attack(forceAddress);
        vm.stopBroadcast();
    }
}