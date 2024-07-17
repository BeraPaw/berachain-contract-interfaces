// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IBGTStaker {
    function getReward() external returns (uint256);
    event Recovered(address token, uint256 amount);
}