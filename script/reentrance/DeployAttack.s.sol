// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import {Attack} from "src/reentrance/Attack.sol";

contract DeployAttack is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address ownerAddress = vm.addr(deployerPrivateKey);
        address reentranceAddress = 0xd8743f1C8c78D972de2Bc02802420c391A68EB75;
        vm.startBroadcast(deployerPrivateKey);
        new Attack(reentranceAddress);
        vm.stopBroadcast();
    }
}