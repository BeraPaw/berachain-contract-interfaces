// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IRewardsModule {
    function getCurrentRewards(
        address depositor,
        address receiver
    ) external view returns (Cosmos.Coin[] memory);

    function getDepositorWithdrawAddress(
        address depositor
    ) external view returns (address);

    function getOutstandingRewards(
        address receiver
    ) external view returns (Cosmos.Coin[] memory);

    function setDepositorWithdrawAddress(
        address withdrawAddress
    ) external returns (bool);

    function withdrawAllDepositorRewards(
        address receiver
    ) external returns (Cosmos.Coin[] memory);

    function withdrawDepositorRewards(
        address receiver,
        uint256 amount
    ) external returns (Cosmos.Coin[] memory);

    function withdrawDepositorRewardsTo(
        address receiver,
        address recipient,
        uint256 amount
    ) external returns (Cosmos.Coin[] memory);

    event InitializeDeposit(
        address indexed caller,
        address indexed depositor,
        Cosmos.Coin[] assets,
        Cosmos.Coin shares
    );
    event SetDepositorWithdrawAddress(
        address indexed depositor,
        address indexed withdrawAddress
    );
    event WithdrawDepositRewards(
        address indexed rewardReceiver,
        address indexed withdrawer,
        address indexed rewardRecipient,
        Cosmos.Coin[] rewardAmount
    );
}

interface Cosmos {
    struct Coin {
        uint256 amount;
        string denom;
    }
}
