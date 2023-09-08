// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {Attack} from "src/coin flip/Attack.sol";

contract DeployAttack is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address ownerAddress = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployerPrivateKey);
        Attack attack = new Attack(0x5b877F60DfEdD13bcE582fd9786B00b6A555FDfc,ownerAddress);
        vm.stopBroadcast();
    }
}