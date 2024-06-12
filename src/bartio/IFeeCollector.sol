// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

interface IFeeCollector {
    function claimFees(address recipient, address[] memory feeTokens) external;

    function donate(uint256 amount) external;

    function payoutAmount() external view returns (uint256);

    function payoutToken() external view returns (address);

    function rewardReceiver() external view returns (address);

    function setPayoutAmount(uint256 _newPayoutAmount) external;

    function setPayoutToken(address _newPayoutToken) external;

    event FeesClaimed(
        address indexed caller,
        address indexed recipient,
        address indexed feeToken,
        uint256 amount
    );
    event FeesDonated(address indexed caller, uint256 amount);
    event PayoutAmountSet(
        uint256 indexed oldPayoutAmount,
        uint256 indexed newPayoutAmount
    );
    event PayoutTokenSet(
        address indexed oldPayoutToken,
        address indexed newPayoutToken
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
