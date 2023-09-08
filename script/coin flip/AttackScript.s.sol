// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {Attack} from "src/coin flip/Attack.sol";

contract AttackScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address ownerAddress = vm.addr(deployerPrivateKey);
        Attack attack = Attack(0x747003640fDDbA6AC5d726Df4Ca983D3daeA255c);
        vm.startBroadcast(deployerPrivateKey);
        attack.attack();
        vm.stopBroadcast();
    }
}