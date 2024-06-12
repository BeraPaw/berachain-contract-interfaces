// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IHoneyModule {
    function getAMOCurrentLimit(
        string memory amoType,
        address amoAddr
    ) external view returns (uint256);

    function getParams() external returns (IHoneyModule.Exchangeable[] memory);

    function getTotalCollateral() external view returns (Cosmos.Coin[] memory);

    function getTotalSupply() external view returns (uint256);

    function mint(
        address to,
        Cosmos.Coin memory collateral
    ) external returns (Cosmos.Coin memory);

    function previewExactOutCollateral(
        Cosmos.Coin memory collateralOut
    ) external view returns (uint256);

    function previewMint(
        Cosmos.Coin memory collateral
    ) external view returns (uint256);

    function previewRedeem(
        uint256 amount,
        string memory denomOut
    ) external view returns (uint256);

    function previewRequiredCollateral(
        uint256 honeyOut,
        string memory denomIn
    ) external view returns (uint256);

    function redeem(
        address from,
        uint256 amount,
        string memory denomOut
    ) external returns (bool);

    function requestHoney(
        address to,
        uint256 amount,
        string memory amoType
    ) external returns (bool);

    function updateParams(
        IHoneyModule.Exchangeable[] memory params
    ) external returns (bool);

    event HoneyMinted(
        address from,
        address to,
        Cosmos.Coin collateral,
        uint256 mintAmount,
        uint256 totalHoneySupply
    );
    event HoneyRedeemed(
        address from,
        uint256 redeemAmount,
        Cosmos.Coin redeemAmountOut,
        uint256 totalHoneySupply
    );

    struct Exchangeable {
        string denom;
        bool enabled;
        uint256 mintRate;
        uint256 redemptionRate;
    }
}

interface Cosmos {
    struct Coin {
        uint256 amount;
        string denom;
    }
}
