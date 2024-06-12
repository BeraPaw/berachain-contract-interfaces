// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

interface IBGT {
    function activateBoost(address validator) external;

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function boosted(
        address account,
        address validator
    ) external view returns (uint128);

    function boostedQueue(
        address account,
        address validator
    ) external view returns (uint32 blockNumberLast, uint128 balance);

    function boostedRewardRate(
        address validator,
        uint256 rewardRate
    ) external view returns (uint256);

    function boostees(address validator) external view returns (uint128);

    function boosts(address account) external view returns (uint128);

    function cancelBoost(address validator, uint128 amount) external;

    function commissionRewardRate(
        address validator,
        uint256 rewardRate
    ) external view returns (uint256);

    function commissions(
        address validator
    ) external view returns (uint32 blockTimestampLast, uint224 rate);

    function decimals() external view returns (uint8);

    function dropBoost(address validator, uint128 amount) external;

    function mint(address distributor, uint256 amount) external;

    function minter() external view returns (address);

    function name() external view returns (string memory);

    function queueBoost(address validator, uint128 amount) external;

    function queuedBoost(address account) external view returns (uint128);

    function redeem(address receiver, uint256 amount) external;

    function setBeraChef(address _beraChef) external;

    function setCommission(address validator, uint256 reward) external;

    function setMinter(address _minter) external;

    function symbol() external view returns (string memory);

    function totalBoosts() external view returns (uint128);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function unboostedBalanceOf(
        address account
    ) external view returns (uint256);

    function whitelistSender(address sender, bool approved) external;

    event ActivateBoost(
        address indexed sender,
        address indexed validator,
        uint128 amount
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event BeraChefChanged(address indexed previous, address indexed current);
    event CancelBoost(
        address indexed sender,
        address indexed validator,
        uint128 amount
    );
    event DropBoost(
        address indexed sender,
        address indexed validator,
        uint128 amount
    );
    event MinterChanged(address indexed previous, address indexed current);
    event QueueBoost(
        address indexed sender,
        address indexed validator,
        uint128 amount
    );
    event Redeem(
        address indexed from,
        address indexed receiver,
        uint256 amount
    );
    event SenderWhitelisted(address indexed sender, bool approved);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event UpdateCommission(
        address indexed validator,
        uint256 oldRate,
        uint256 newRate
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
