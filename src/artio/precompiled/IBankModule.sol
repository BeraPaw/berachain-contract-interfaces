// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IBankModule {
    function getAllBalances(
        address accountAddress
    ) external view returns (Cosmos.Coin[] memory);

    function getAllSpendableBalances(
        address accountAddress
    ) external view returns (Cosmos.Coin[] memory);

    function getAllSupply() external view returns (Cosmos.Coin[] memory);

    function getBalance(
        address accountAddress,
        string memory denom
    ) external view returns (uint256);

    function getSpendableBalance(
        address accountAddress,
        string memory denom
    ) external view returns (uint256);

    function getSupply(string memory denom) external view returns (uint256);

    function send(
        address toAddress,
        Cosmos.Coin[] memory amount
    ) external payable returns (bool);

    event Burn(address indexed burner, Cosmos.Coin[] amount);
    event CoinReceived(address indexed receiver, Cosmos.Coin[] amount);
    event CoinSpent(address indexed spender, Cosmos.Coin[] amount);
    event Coinbase(address indexed minter, Cosmos.Coin[] amount);
    event Message(address indexed sender);
    event Transfer(address indexed recipient, Cosmos.Coin[] amount);
}

interface Cosmos {
    struct Coin {
        uint256 amount;
        string denom;
    }
}
