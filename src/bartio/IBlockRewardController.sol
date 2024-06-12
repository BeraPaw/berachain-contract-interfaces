// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

interface IBlockRewardController {
    function baseRate() external view returns (uint256);

    function minBoostedRewardRate() external view returns (uint256);

    function processRewards(
        address coinbase,
        uint256 blockNumber
    ) external returns (uint256);

    function rewardRate() external view returns (uint256);

    function setBaseRate(uint256 _baseRate) external;

    function setDistributor(address _distributor) external;

    function setMinBoostedRewardRate(uint256 _minBoostedRewardRate) external;

    function setRewardRate(uint256 _rewardRate) external;

    event BaseRateChanged(uint256 oldBaseRate, uint256 newBaseRate);
    event BlockRewardProcessed(
        uint256 blockNumber,
        uint256 baseRate,
        uint256 commissionRate,
        uint256 rewardRate
    );
    event MinBoostedRewardRateChanged(
        uint256 oldMinBoostedRewardRate,
        uint256 newMinBoostedRewardRate
    );
    event RewardRateChanged(uint256 oldRewardRate, uint256 newRewardRate);
    event SetDistributor(address indexed rewardDistribution);
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
