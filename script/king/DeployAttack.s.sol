// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {Attack} from "src/king/Attack.sol";

contract DeployAttack is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address ownerAddress = vm.addr(deployerPrivateKey);
        address kingAddress = 0x266B38f9eb5e7504B0Df9852921ae9a864AB9DB0;
        vm.startBroadcast(deployerPrivateKey);
        new Attack(kingAddress);
        vm.stopBroadcast();
    }
}