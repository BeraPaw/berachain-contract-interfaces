// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IERC20BribeModule {
    function bribeModule() external view returns (address);

    function claimAllBribes(address delegator) external returns (bool);

    function claimValidatorBribes(
        address delegator,
        address validator
    ) external returns (bool);

    function createBribe(
        address operator,
        uint64 startEpoch,
        uint64 numBlockProposals,
        address[] memory tokens,
        uint256[] memory amounts
    ) external payable returns (bool);

    function distributionModule() external view returns (address);

    function erc20Module() external view returns (address);

    function getActiveValidatorBribes(
        address operator
    ) external view returns (IERC20BribeModule.Bribe[] memory bribe);

    function getAllValidatorBribes(
        address operator
    ) external view returns (IERC20BribeModule.Bribe[] memory bribe);

    function getBribesForValidator(
        address operator,
        uint64 startEpoch
    ) external view returns (IERC20BribeModule.Bribe[] memory);

    function previewClaimAllBribes(
        address delegator
    ) external view returns (IERC20BribeModule.Reward[] memory rewards);

    function previewClaimValidatorBribes(
        address delegator
    )
        external
        view
        returns (IERC20BribeModule.ValidatorReward[] memory rewards);

    struct BribePerProposal {
        address[] tokens;
        uint256[] amounts;
    }

    struct Bribe {
        address consensusAddress;
        uint64 startEpoch;
        uint64 numBlockProposals;
        uint64 numBlockProposalsBribed;
        BribePerProposal bribePerProposal;
    }

    struct Reward {
        address token;
        uint256 amount;
    }

    struct ValidatorReward {
        address validator;
        Reward[] reward;
    }
}
