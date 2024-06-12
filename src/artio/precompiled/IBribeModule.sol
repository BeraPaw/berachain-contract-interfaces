// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IBribeModule {
    function createBribe(
        address operator,
        uint64 startEpoch,
        uint64 numBlockProposals,
        Cosmos.Coin[] memory bribePerProposal
    ) external payable returns (bool);

    function getActiveValidatorBribes(
        address operator
    ) external view returns (IBribeModule.Bribe[] memory bribes);

    function getAllValidatorBribes(
        address operator
    ) external view returns (IBribeModule.Bribe[] memory bribes);

    function getBribeFees() external view returns (Cosmos.Coin[] memory fee);

    function getBribes(
        address operator,
        uint64 startEpoch
    ) external view returns (IBribeModule.Bribe[] memory bribes);

    function updateParams(Cosmos.Coin[] memory fee) external returns (bool);

    event BribeCreated(
        address bribeCreator,
        address consensusAddr,
        uint64 startEpoch,
        uint64 numBlockProposals,
        Cosmos.Coin[] bribePerProposal
    );
    struct Bribe {
        address consensusAddress;
        uint64 startEpoch;
        uint64 numBlockProposals;
        uint64 numBlockProposalsBribed;
        Cosmos.Coin[] bribePerProposal;
    }
}

interface Cosmos {
    struct Coin {
        uint256 amount;
        string denom;
    }
}
