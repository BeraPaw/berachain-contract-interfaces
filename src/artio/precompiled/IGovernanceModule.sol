// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IGovernanceModule {
    function cancelProposal(
        uint64 proposalId
    ) external returns (uint64, uint64);

    function getConstitution() external view returns (string memory);

    function getDepositParams()
        external
        view
        returns (IGovernanceModule.DepositParams memory);

    function getParams()
        external
        view
        returns (IGovernanceModule.Params memory);

    function getProposal(
        uint64 proposalId
    ) external view returns (IGovernanceModule.Proposal memory);

    function getProposalDeposits(
        uint64 proposalId
    ) external view returns (Cosmos.Coin[] memory);

    function getProposalDepositsByDepositor(
        uint64 proposalId,
        address depositor
    ) external view returns (Cosmos.Coin[] memory);

    function getProposalTallyResult(
        uint64 proposalId
    ) external view returns (IGovernanceModule.TallyResult memory);

    function getProposalVotes(
        uint64 proposalId,
        Cosmos.PageRequest memory pagination
    )
        external
        view
        returns (IGovernanceModule.Vote[] memory, Cosmos.PageResponse memory);

    function getProposalVotesByVoter(
        uint64 proposalId,
        address voter
    ) external view returns (IGovernanceModule.Vote memory);

    function getProposals(
        int32 proposalStatus,
        Cosmos.PageRequest memory pagination
    )
        external
        view
        returns (
            IGovernanceModule.Proposal[] memory,
            Cosmos.PageResponse memory
        );

    function getTallyParams()
        external
        view
        returns (IGovernanceModule.TallyParams memory);

    function getVotingParams()
        external
        view
        returns (IGovernanceModule.VotingParams memory);

    function submitProposal(
        IGovernanceModule.MsgSubmitProposal memory proposal
    ) external returns (uint64);

    function vote(
        uint64 proposalId,
        int32 option,
        string memory metadata
    ) external returns (bool);

    function voteWeighted(
        uint64 proposalId,
        IGovernanceModule.WeightedVoteOption[] memory options,
        string memory metadata
    ) external returns (bool);

    event CancelProposal(uint64 indexed proposalId, address indexed sender);
    event ProposalDeposit(uint64 indexed proposalId, Cosmos.Coin[] amount);
    event ProposalSubmitted(
        uint64 indexed proposalId,
        address indexed proposalSender
    );
    event ProposalVoted(IGovernanceModule.Vote proposalVote);

    struct DepositParams {
        Cosmos.Coin[] minDeposit;
        uint64 maxDepositPeriod;
    }

    struct Params {
        Cosmos.Coin[] minDeposit;
        uint64 maxDepositPeriod;
        uint64 votingPeriod;
        string quorum;
        string threshold;
        string vetoThreshold;
        string minInitialDepositRatio;
        string proposalCancelRatio;
        string proposalCancelDest;
        uint64 expeditedVotingPeriod;
        string expeditedThreshold;
        Cosmos.Coin[] expeditedMinDeposit;
        bool burnVoteQuorum;
        bool burnProposalDepositPrevote;
        bool burnVoteVeto;
    }

    struct TallyResult {
        string yesCount;
        string abstainCount;
        string noCount;
        string noWithVetoCount;
    }

    struct Proposal {
        uint64 id;
        Cosmos.CodecAny[] messages;
        int32 status;
        TallyResult finalTallyResult;
        uint64 submitTime;
        uint64 depositEndTime;
        Cosmos.Coin[] totalDeposit;
        uint64 votingStartTime;
        uint64 votingEndTime;
        string metadata;
        string title;
        string summary;
        address proposer;
    }

    struct WeightedVoteOption {
        int32 voteOption;
        string weight;
    }

    struct Vote {
        uint64 proposalId;
        address voter;
        WeightedVoteOption[] options;
        string metadata;
    }

    struct TallyParams {
        string quorum;
        string threshold;
        string vetoThreshold;
    }

    struct VotingParams {
        uint64 votingPeriod;
    }

    struct MsgSubmitProposal {
        Cosmos.CodecAny[] messages;
        Cosmos.Coin[] initialDeposit;
        address proposer;
        string metadata;
        string title;
        string summary;
        bool expedited;
    }
}

interface Cosmos {
    struct Coin {
        uint256 amount;
        string denom;
    }

    struct CodecAny {
        string typeURL;
        bytes value;
    }

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
}
