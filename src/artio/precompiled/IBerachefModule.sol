// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IBerachefModule {
    function getActiveCuttingBoard(
        address operatorAddr
    ) external view returns (IBerachefModule.CuttingBoard memory);

    function getDelegation(
        address operatorAddr
    ) external view returns (address);

    function getQueuedCuttingBoard(
        address operatorAddr
    ) external view returns (IBerachefModule.CuttingBoard memory);

    function queueNewCuttingBoard(
        address operatorAddr,
        IBerachefModule.Weight[] memory weights,
        int64 startEpoch
    ) external payable returns (bool);

    function setDelegation(address delegationAddress) external returns (bool);

    function updateFriendsOfTheChef(
        address receiverAddress,
        bool friendOfTheChef
    ) external returns (bool);

    event QueueCuttingBoard(
        address consensusAddr,
        IBerachefModule.Weight[] cuttingBoardWeights,
        int64 cuttingBoardStartEpoch
    );
    struct Weight {
        address receiverAddress;
        uint256 percentageNumerator;
    }

    struct CuttingBoard {
        address consAddr;
        Weight[] weights;
        int64 startEpoch;
    }
}
