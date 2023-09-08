// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {Attack} from "src/telephone/Attack.sol";

contract DeployAttack is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address ownerAddress = vm.addr(deployerPrivateKey);
        address telephoneAddress = 0xd918097f67DcDCfDB2F0ee48d038489EBBAeB738;
        vm.startBroadcast(deployerPrivateKey);
        new Attack(telephoneAddress);
        vm.stopBroadcast();
    }
}