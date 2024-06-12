// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IBerachainRewardsVault {
    function addIncentive(
        address token,
        uint256 amount,
        uint256 incentiveRate
    ) external;

    function balanceOf(address account) external view returns (uint256);

    function delegateStake(address account, uint256 amount) external;

    function delegateWithdraw(address account, uint256 amount) external;

    function distributor() external view returns (address);

    function earned(address account) external view returns (uint256);

    function exit() external;

    function getDelegateStake(
        address account,
        address delegate
    ) external view returns (uint256);

    function getReward(address account) external returns (uint256);

    function getRewardForDuration() external view returns (uint256);

    function getTotalDelegateStaked(
        address account
    ) external view returns (uint256);

    function getWhitelistedTokens() external view returns (address[] memory);

    function getWhitelistedTokensCount() external view returns (uint256);

    function initialize(
        address _berachef,
        address _bgt,
        address _distributor,
        address _stakingToken
    ) external;

    function lastTimeRewardApplicable() external view returns (uint256);

    function notifyRewardAmount(address coinbase, uint256 reward) external;

    function operator(address account) external view returns (address);

    function pause(bool _paused) external;

    function recoverERC20(address tokenAddress, uint256 tokenAmount) external;

    function removeIncentiveToken(address token) external;

    function rewardPerToken() external view returns (uint256);

    function setDistributor(address _rewardDistribution) external;

    function setMaxIncentiveTokensCount(
        uint8 _maxIncentiveTokensCount
    ) external;

    function setOperator(address _operator) external;

    function setRewardsDuration(uint256 _rewardsDuration) external;

    function stake(uint256 amount) external;

    function totalSupply() external view returns (uint256);

    function whitelistIncentiveToken(
        address token,
        uint256 minIncentiveRate
    ) external;

    function withdraw(uint256 amount) external;

    event DelegateStaked(
        address indexed account,
        address indexed delegate,
        uint256 amount
    );
    event DelegateWithdrawn(
        address indexed account,
        address indexed delegate,
        uint256 amount
    );
    event DistributorSet(address indexed distributor);
    event IncentiveAdded(
        address indexed token,
        address sender,
        uint256 amount,
        uint256 incentiveRate
    );
    event IncentiveTokenRemoved(address indexed token);
    event IncentiveTokenWhitelisted(
        address indexed token,
        uint256 minIncentiveRate
    );
    event IncentivesProcessed(
        address indexed coinbase,
        address indexed token,
        uint256 bgtEmitted,
        uint256 amount
    );
    event MaxIncentiveTokensCountUpdated(uint8 maxIncentiveTokensCount);
    event OperatorSet(address account, address operator);
    event Recovered(address token, uint256 amount);
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
