// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IMulticall3 {
    function aggregate(
        IMulticall3.Call[] memory calls
    ) external payable returns (uint256 blockNumber, bytes[] memory returnData);

    function aggregate3(
        IMulticall3.Call3[] memory calls
    ) external payable returns (IMulticall3.Result[] memory returnData);

    function aggregate3Value(
        IMulticall3.Call3Value[] memory calls
    ) external payable returns (IMulticall3.Result[] memory returnData);

    function blockAndAggregate(
        IMulticall3.Call[] memory calls
    )
        external
        payable
        returns (
            uint256 blockNumber,
            bytes32 blockHash,
            IMulticall3.Result[] memory returnData
        );

    function getBasefee() external view returns (uint256 basefee);

    function getBlockHash(
        uint256 blockNumber
    ) external view returns (bytes32 blockHash);

    function getBlockNumber() external view returns (uint256 blockNumber);

    function getChainId() external view returns (uint256 chainid);

    function getCurrentBlockCoinbase() external view returns (address coinbase);

    function getCurrentBlockDifficulty()
        external
        view
        returns (uint256 difficulty);

    function getCurrentBlockGasLimit() external view returns (uint256 gaslimit);

    function getCurrentBlockTimestamp()
        external
        view
        returns (uint256 timestamp);

    function getEthBalance(
        address addr
    ) external view returns (uint256 balance);

    function getLastBlockHash() external view returns (bytes32 blockHash);

    function tryAggregate(
        bool requireSuccess,
        IMulticall3.Call[] memory calls
    ) external payable returns (IMulticall3.Result[] memory returnData);

    function tryBlockAndAggregate(
        bool requireSuccess,
        IMulticall3.Call[] memory calls
    )
        external
        payable
        returns (
            uint256 blockNumber,
            bytes32 blockHash,
            IMulticall3.Result[] memory returnData
        );

    struct Call {
        address target;
        bytes callData;
    }

    struct Call3 {
        address target;
        bool allowFailure;
        bytes callData;
    }

    struct Result {
        bool success;
        bytes returnData;
    }

    struct Call3Value {
        address target;
        bool allowFailure;
        uint256 value;
        bytes callData;
    }
}
