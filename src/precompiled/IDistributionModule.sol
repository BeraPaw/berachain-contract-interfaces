// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IDistributionModule {
    function getAllDelegatorRewards(
        address delegator
    ) external view returns (IDistributionModule.ValidatorReward[] memory);

    function getDelegatorValidatorReward(
        address delegator,
        address validator
    ) external view returns (Cosmos.Coin[] memory);

    function getTotalDelegatorReward(
        address delegator
    ) external view returns (Cosmos.Coin[] memory);

    function getWithdrawAddress(
        address delegator
    ) external view returns (address);

    function getWithdrawEnabled() external view returns (bool);

    function setWithdrawAddress(
        address withdrawAddress
    ) external returns (bool);

    function withdrawDelegatorReward(
        address delegator,
        address validator
    ) external returns (Cosmos.Coin[] memory);

    event SetWithdrawAddress(address indexed withdrawAddress);
    event WithdrawRewards(address indexed validator, Cosmos.Coin[] amount);

    struct ValidatorReward {
        address validator;
        Cosmos.Coin[] rewards;
    }
}

interface Cosmos {
    struct Coin {
        uint256 amount;
        string denom;
    }
}
