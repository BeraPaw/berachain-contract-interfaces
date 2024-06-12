// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IERC20DexModule {
    function addLiquidity(
        address pool,
        address receiver,
        address[] memory assetsIn,
        uint256[] memory amountsIn
    )
        external
        payable
        returns (
            address[] memory shares,
            uint256[] memory shareAmounts,
            address[] memory liquidity,
            uint256[] memory liquidityAmounts
        );

    function batchSwap(
        uint8 kind,
        IERC20DexModule.BatchSwapStep[] memory swaps,
        uint256 deadline
    )
        external
        payable
        returns (address[] memory assets, uint256[] memory amounts);

    function createPool(
        string memory name,
        address[] memory assetsIn,
        uint256[] memory amountsIn,
        string memory poolType,
        IERC20DexModule.PoolOptions memory options
    ) external payable returns (address);

    function getExchangeRate(
        address pool,
        address baseAsset,
        address quoteAsset
    ) external view returns (uint256);

    function getLiquidity(
        address pool
    ) external view returns (address[] memory asset, uint256[] memory amounts);

    function getPoolName(address pool) external view returns (string memory);

    function getPoolOptions(
        address pool
    ) external view returns (IERC20DexModule.PoolOptions memory);

    function getPreviewAddLiquidityNoSwap(
        address pool,
        address[] memory assets,
        uint256[] memory amounts
    )
        external
        view
        returns (
            address[] memory shares,
            uint256[] memory shareAmounts,
            address[] memory liqOut,
            uint256[] memory liquidityAmounts
        );

    function getPreviewAddLiquidityStaticPrice(
        address pool,
        address[] memory liquidity,
        uint256[] memory amounts
    )
        external
        view
        returns (
            address[] memory shares,
            uint256[] memory shareAmounts,
            address[] memory liqOut,
            uint256[] memory liquidityAmounts
        );

    function getPreviewBatchSwap(
        uint8 kind,
        IERC20DexModule.BatchSwapStep[] memory swaps
    ) external view returns (address asset, uint256 amount);

    function getPreviewBurnShares(
        address pool,
        address asset,
        uint256 amount
    ) external view returns (address[] memory assets, uint256[] memory amounts);

    function getPreviewSharesForLiquidity(
        address pool,
        address[] memory assets,
        uint256[] memory amounts
    )
        external
        view
        returns (
            address[] memory shares,
            uint256[] memory shareAmounts,
            address[] memory liquidity,
            uint256[] memory liquidityAmounts
        );

    function getPreviewSharesForSingleSidedLiquidityRequest(
        address pool,
        address asset,
        uint256 amount
    ) external view returns (address[] memory assets, uint256[] memory amounts);

    function getPreviewSwapExact(
        uint8 kind,
        address pool,
        address baseAsset,
        uint256 baseAssetAmount,
        address quoteAsset
    ) external view returns (address asset, uint256 amount);

    function getRemoveLiquidityExactAmountOut(
        address pool,
        address assetIn,
        uint256 assetAmount
    ) external view returns (address[] memory assets, uint256[] memory amounts);

    function getRemoveLiquidityOneSideOut(
        address pool,
        address assetOut,
        uint256 sharesIn
    ) external view returns (address[] memory assets, uint256[] memory amounts);

    function getTotalShares(
        address pool
    ) external view returns (address[] memory assets, uint256[] memory amounts);

    function removeLiquidityBurningShares(
        address pool,
        address withdrawAddress,
        address assetIn,
        uint256 amountIn
    )
        external
        payable
        returns (address[] memory liquidity, uint256[] memory liquidityAmounts);

    function removeLiquidityExactAmount(
        address pool,
        address withdrawAddress,
        address assetOut,
        uint256 amountOut,
        address sharesIn,
        uint256 maxSharesIn
    )
        external
        payable
        returns (
            address[] memory shares,
            uint256[] memory shareAmounts,
            address[] memory liquidity,
            uint256[] memory liquidityAmounts
        );

    function swap(
        uint8 kind,
        address poolId,
        address assetIn,
        uint256 amountIn,
        address assetOut,
        uint256 amountOut,
        uint256 deadline
    )
        external
        payable
        returns (address[] memory assets, uint256[] memory amounts);

    struct BatchSwapStep {
        address poolId;
        address assetIn;
        uint256 amountIn;
        address assetOut;
        uint256 amountOut;
        bytes userData;
    }

    struct AssetWeight {
        address asset;
        uint256 weight;
    }

    struct PoolOptions {
        AssetWeight[] weights;
        uint256 swapFee;
    }
}
