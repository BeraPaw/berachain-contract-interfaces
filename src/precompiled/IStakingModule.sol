// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IStakingModule {
    function beginRedelegate(
        address srcValidator,
        address dstValidator,
        uint256 amount
    ) external payable returns (bool);

    function cancelUnbondingDelegation(
        address validatorAddress,
        uint256 amount,
        int64 creationHeight
    ) external payable returns (bool);

    function delegate(
        address validatorAddress,
        uint256 amount
    ) external payable returns (bool);

    function getBondedValidators(
        Cosmos.PageRequest memory pagination
    )
        external
        view
        returns (IStakingModule.Validator[] memory, Cosmos.PageResponse memory);

    function getBondedValidatorsByPower()
        external
        view
        returns (address[] memory);

    function getDelegation(
        address delegatorAddress,
        address validatorAddress
    ) external view returns (uint256);

    function getDelegatorUnbondingDelegations(
        address delegatorAddress,
        Cosmos.PageRequest memory pagination
    )
        external
        view
        returns (
            IStakingModule.UnbondingDelegation[] memory,
            Cosmos.PageResponse memory
        );

    function getDelegatorValidators(
        address delegatorAddress,
        Cosmos.PageRequest memory pagination
    )
        external
        view
        returns (IStakingModule.Validator[] memory, Cosmos.PageResponse memory);

    function getRedelegations(
        address delegatorAddress,
        address srcValidator,
        address dstValidator,
        Cosmos.PageRequest memory pagination
    )
        external
        view
        returns (
            IStakingModule.RedelegationEntry[] memory,
            Cosmos.PageResponse memory
        );

    function getUnbondingDelegation(
        address delegatorAddress,
        address validatorAddress
    ) external view returns (IStakingModule.UnbondingDelegationEntry[] memory);

    function getValAddressFromConsAddress(
        bytes memory consAddr
    ) external pure returns (address);

    function getValidator(
        address validatorAddress
    ) external view returns (IStakingModule.Validator memory);

    function getValidatorDelegations(
        address validatorAddress,
        Cosmos.PageRequest memory pagination
    )
        external
        view
        returns (
            IStakingModule.Delegation[] memory,
            Cosmos.PageResponse memory
        );

    function getValidators(
        Cosmos.PageRequest memory pagination
    )
        external
        view
        returns (IStakingModule.Validator[] memory, Cosmos.PageResponse memory);

    function undelegate(
        address validatorAddress,
        uint256 amount
    ) external payable returns (bool);

    event CancelUnbondingDelegation(
        address indexed validator,
        address indexed delegator,
        Cosmos.Coin[] amount,
        int64 creationHeight
    );
    event CreateValidator(address indexed validator, Cosmos.Coin[] amount);
    event Delegate(address indexed validator, Cosmos.Coin[] amount);
    event Redelegate(
        address indexed sourceValidator,
        address indexed destinationValidator,
        Cosmos.Coin[] amount
    );
    event Unbond(address indexed validator, Cosmos.Coin[] amount);

    struct Description {
        string moniker;
        string identity;
        string website;
        string securityContact;
        string details;
    }

    struct CommissionRates {
        uint256 rate;
        uint256 maxRate;
        uint256 maxChangeRate;
    }

    struct Commission {
        CommissionRates commissionRates;
        string updateTime;
    }

    struct Validator {
        address operatorAddr;
        bytes consAddr;
        bool jailed;
        string status;
        uint256 tokens;
        uint256 delegatorShares;
        Description description;
        int64 unbondingHeight;
        string unbondingTime;
        Commission commission;
        uint256 minSelfDelegation;
        int64 unbondingOnHoldRefCount;
        uint64[] unbondingIds;
    }

    struct UnbondingDelegationEntry {
        int64 creationHeight;
        string completionTime;
        uint256 initialBalance;
        uint256 balance;
        uint64 unbondingId;
    }

    struct UnbondingDelegation {
        address delegatorAddress;
        address validatorAddress;
        UnbondingDelegationEntry[] entries;
    }

    struct RedelegationEntry {
        int64 creationHeight;
        string completionTime;
        uint256 initialBalance;
        uint256 sharesDst;
        uint64 unbondingId;
    }

    struct Delegation {
        address delegator;
        uint256 balance;
        uint256 shares;
    }
}

interface Cosmos {
    struct PageRequest {
        string key;
        uint64 offset;
        uint64 limit;
        bool countTotal;
        bool reverse;
    }

    struct PageResponse {
        string nextKey;
        uint64 total;
    }

    struct Coin {
        uint256 amount;
        string denom;
    }
}
