// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IOracleModule {
    function addCurrencyPairs(string[] memory pairs) external returns (bool);

    function getAllCurrencyPairs() external view returns (string[] memory);

    function getDecimals(string memory pair) external view returns (uint8);

    function getPrice(
        string memory pair
    ) external view returns (int256, uint256, uint64);

    function hasCurrencyPair(string memory pair) external view returns (bool);

    function removeCurrencyPairs(string[] memory pairs) external returns (bool);

    event CurrencyPairsAdded(string[] currencyPairs);
    event CurrencyPairsRemoved(string[] currencyPairs);
}
