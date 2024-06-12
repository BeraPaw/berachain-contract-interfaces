// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IBGTModule {
    function redeem(
        address receiver,
        uint256 amount
    ) external returns (uint256);

    event Redeem(
        address indexed bgtburner,
        address indexed berareceiver,
        uint256 redeemed
    );
}
