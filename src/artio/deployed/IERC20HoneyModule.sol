// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IERC20HoneyModule {
    function erc20Module() external view returns (address);

    function getAMOCurrentLimit(
        string memory amoType,
        address amoAddr
    ) external view returns (uint256);

    function getExchangable()
        external
        returns (IERC20HoneyModule.ERC20Exchangable[] memory);

    function getTotalCollateral()
        external
        view
        returns (address[] memory, uint256[] memory);

    function getTotalSupply() external view returns (uint256);

    function honey() external view returns (address);

    function honeyModule() external view returns (address);

    function mint(
        address to,
        address collateral,
        uint256 amount
    ) external returns (uint256);

    function previewExactOutCollateral(
        uint256 amountOut,
        address assetOut
    ) external view returns (uint256);

    function previewMint(
        address collateral,
        uint256 amount
    ) external view returns (uint256);

    function previewRedeem(
        address collateral,
        uint256 amount
    ) external view returns (uint256);

    function previewRequiredCollateral(
        uint256 honeyOut,
        address assetIn
    ) external view returns (uint256);

    function redeem(
        address to,
        uint256 amount,
        address collateral
    ) external returns (uint256);

    function updateParams(
        IERC20HoneyModule.ERC20Exchangable[] memory params
    ) external returns (bool);

    struct ERC20Exchangable {
        address collateral;
        bool enabled;
        uint256 mintRate;
        uint256 redemptionRate;
    }
}
