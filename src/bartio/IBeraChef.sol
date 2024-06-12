// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IBeraChef {
    struct Weight {
        address receiver;
        uint96 percentageNumerator;
    }

    struct CuttingBoard {
        uint64 startBlock;
        Weight[] weights;
    }

    function activateQueuedCuttingBoard(
        address valCoinbase,
        uint256 blockNumber
    ) external;

    function getActiveCuttingBoard(
        address valCoinbase
    ) external view returns (IBeraChef.CuttingBoard memory);

    function getDefaultCuttingBoard()
        external
        view
        returns (IBeraChef.CuttingBoard memory);

    function getOperator(address valCoinbase) external view returns (address);

    function getQueuedCuttingBoard(
        address valCoinbase
    ) external view returns (IBeraChef.CuttingBoard memory);

    function isQueuedCuttingBoardReady(
        address valCoinbase,
        uint256 blockNumber
    ) external view returns (bool);

    function isReady() external view returns (bool);

    function queueNewCuttingBoard(
        address valCoinbase,
        uint64 startBlock,
        Weight[] memory weights
    ) external;

    function setCuttingBoardBlockDelay(uint64 _cuttingBoardBlockDelay) external;

    function setDefaultCuttingBoard(CuttingBoard memory cuttingBoard) external;

    function setMaxNumWeightsPerCuttingBoard(
        uint8 _maxNumWeightsPerCuttingBoard
    ) external;

    function setOperator(address operatorAddress) external;

    function updateFriendsOfTheChef(address receiver, bool isFriend) external;

    event ActivateCuttingBoard(
        address indexed valCoinbase,
        uint64 startBlock,
        Weight[] weights
    );
    event CuttingBoardBlockDelaySet(uint64 cuttingBoardBlockDelay);
    event FriendsOfTheChefUpdated(
        address indexed receiver,
        bool indexed isFriend
    );
    event MaxNumWeightsPerCuttingBoardSet(uint8 maxNumWeightsPerCuttingBoard);
    event QueueCuttingBoard(
        address indexed valCoinbase,
        uint64 startBlock,
        Weight[] weights
    );
    event SetDefaultCuttingBoard(CuttingBoard cuttingBoard);
    event SetOperator(
        address indexed valCoinbase,
        address indexed operatorAddress
    );
    error AlreadyInitialized();
    error AmountLessThanMinIncentiveRate();
    error BlockDoesNotExist();
    error BlockNotInBuffer();
    error CannotRecoverRewardToken();
    error CannotRecoverStakingToken();
    error DelegateStakedOverflow();
    error InsolventReward();
    error InsufficientDelegateStake();
    error InsufficientSelfStake();
    error InsufficientStake();
    error InvalidCommission();
    error InvalidCuttingBoardWeights();
    error InvalidMaxIncentiveTokensCount();
    error InvalidMinter();
    error InvalidStartBlock();
    error InvariantCheckFailed();
    error MaxNumWeightsPerCuttingBoardIsZero();
    error NoWhitelistedTokens();
    error NotActionableBlock();
    error NotApprovedSender();
    error NotBGT();
    error NotBlockRewardController();
    error NotDelegate();
    error NotDistributor();
    error NotEnoughBalance();
    error NotEnoughTime();
    error NotFeeCollector();
    error NotFriendOfTheChef();
    error NotGovernance();
    error NotOperator();
    error NotProver();
    error NotRootFollower();
    error NotValidatorOrOperator();
    error PayoutAmountIsZero();
    error PayoutTokenIsZero();
    error QueuedCuttingBoardNotFound();
    error QueuedCuttingBoardNotReady();
    error RewardCycleNotEnded();
    error RewardCycleStarted();
    error StakeAmountIsZero();
    error TokenAlreadyWhitelistedOrLimitReached();
    error TokenNotWhitelisted();
    error TooManyWeights();
    error TotalSupplyOverflow();
    error Unauthorized(address);
    error VaultAlreadyExists();
    error WithdrawAmountIsZero();
    error ZeroAddress();
}
