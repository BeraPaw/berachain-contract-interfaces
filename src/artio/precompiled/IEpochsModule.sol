// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IEpochsModule {
    function getCurrentEpoch(
        string memory identifier
    )
        external
        view
        returns (int64 epochNumber, int64 startTimestamp, int64 endTimestamp);

    event EpochEnd(int64 indexed epochNumber, int64 endTime);
    event EpochStart(int64 indexed epochNumber, int64 startTime);
}
