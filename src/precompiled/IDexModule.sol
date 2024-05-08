// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IDexModule {
    function addLiquidity(
        string memory pool,
        address account,
        address receiver,
        Cosmos.Coin[] memory coins
    ) external payable returns (Cosmos.Coin[] memory, Cosmos.Coin[] memory);

    function batchSwap(
        uint8 kind,
        IDexModule.BatchSwapStep[] memory swaps,
        Cosmos.Coin[] memory coins,
        uint256 deadline
    ) external payable returns (Cosmos.Coin[] memory);

    function createPool(
        string memory name,
        Cosmos.Coin[] memory coins,
        string memory poolType,
        bytes memory options,
        address creator
    ) external payable returns (string memory);

    function getExchangeRate(
        string memory pool,
        string memory baseAsset,
        string memory quoteAsset
    ) external view returns (uint256);

    function getLiquidity(
        string memory pool
    ) external view returns (Cosmos.Coin[] memory);

    function getPoolAddress(string memory pool) external view returns (address);

    function getPoolName(
        string memory pool
    ) external view returns (string memory);

    function getPoolOptions(
        string memory pool
    ) external view returns (IDexModule.PoolOptions memory);

    function getPreviewAddLiquidityNoSwap(
        string memory pool,
        Cosmos.Coin[] memory liquidity
    ) external view returns (Cosmos.Coin[] memory, Cosmos.Coin[] memory);

    function getPreviewAddLiquidityStaticPrice(
        string memory pool,
        Cosmos.Coin[] memory liquidity
    ) external view returns (Cosmos.Coin[] memory, Cosmos.Coin[] memory);

    function getPreviewBatchSwap(
        uint8 kind,
        IDexModule.BatchSwapStep[] memory swaps,
        Cosmos.Coin[] memory coins
    ) external view returns (Cosmos.Coin memory);

    function getPreviewBurnShares(
        string memory pool,
        Cosmos.Coin memory shares
    ) external view returns (Cosmos.Coin[] memory);

    function getPreviewSharesForLiquidity(
        string memory pool,
        Cosmos.Coin[] memory coins
    ) external view returns (Cosmos.Coin[] memory, Cosmos.Coin[] memory);

    function getPreviewSharesForSingleSidedLiquidityRequest(
        string memory pool,
        Cosmos.Coin memory coin
    ) external view returns (Cosmos.Coin[] memory);

    function getPreviewSwapExact(
        uint8 kind,
        string memory pool,
        Cosmos.Coin memory baseAsset,
        string memory quoteAsset
    ) external view returns (Cosmos.Coin memory);

    function getRemoveLiquidityExactAmountOut(
        string memory pool,
        Cosmos.Coin memory asset
    ) external view returns (Cosmos.Coin[] memory);

    function getRemoveLiquidityOneSideOut(
        string memory pool,
        string memory denom,
        uint256 sharesIn
    ) external view returns (Cosmos.Coin[] memory);

    function getTotalShares(
        string memory pool
    ) external view returns (Cosmos.Coin[] memory);

    function removeLiquidityBurningShares(
        string memory pool,
        address account,
        address receiver,
        Cosmos.Coin memory coin
    ) external payable returns (Cosmos.Coin[] memory);

    function removeLiquidityExactAmount(
        string memory pool,
        address account,
        address receiver,
        Cosmos.Coin memory coin,
        Cosmos.Coin memory maxShares
    ) external payable returns (Cosmos.Coin[] memory, Cosmos.Coin[] memory);

    function swap(
        IDexModule.SingleSwap memory singleSwap,
        uint256 limit,
        uint256 deadline
    ) external payable returns (Cosmos.Coin[] memory);

    event AddLiquidity(
        string pool,
        Cosmos.Coin[] liquidityIn,
        Cosmos.Coin sharesOut,
        address sender
    );
    event PoolCreated(
        string pool,
        string poolName,
        string poolShareDenom,
        IDexModule.PoolOptions poolOptions,
        Cosmos.Coin[] liquidity
    );
    event RemoveLiquidity(
        string pool,
        Cosmos.Coin sharesIn,
        Cosmos.Coin[] liquidityOut,
        address sender
    );
    event Swap(
        string pool,
        Cosmos.Coin swapIn,
        Cosmos.Coin swapOut,
        address sender
    );
    struct BatchSwapStep {
        string poolId;
        uint256 assetInIndex;
        uint256 assetOutIndex;
        bytes userData;
    }

    struct AssetWeight {
        string denom;
        uint256 weight;
    }

    struct PoolOptions {
        AssetWeight[] weights;
        uint256 swapFee;
    }

    struct SingleSwap {
        string poolId;
        uint8 kind;
        string assetIn;
        string assetOut;
        uint256 amount;
        bytes userData;
    }
}

interface Cosmos {
    struct Coin {
        uint256 amount;
        string denom;
    }
}
