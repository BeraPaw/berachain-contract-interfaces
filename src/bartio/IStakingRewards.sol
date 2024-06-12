// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

interface IStakingRewards {
    function balanceOf(address account) external view returns (uint256);

    function earned(address account) external view returns (uint256);

    function getRewardForDuration() external view returns (uint256);

    function lastTimeRewardApplicable() external view returns (uint256);

    function rewardPerToken() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    event RewardAdded(uint256 reward);
    event RewardPaid(address indexed account, address to, uint256 reward);
    event RewardsDurationUpdated(uint256 newDuration);
    event Staked(address indexed account, uint256 amount);
    event Withdrawn(address indexed account, uint256 amount);
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
