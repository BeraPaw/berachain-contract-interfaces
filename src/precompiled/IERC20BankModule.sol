// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IERC20BankModule {
    function coinDenomForERC20Address(
        address token
    ) external view returns (string memory);

    function erc20AddressForCoinDenom(
        string memory denom
    ) external view returns (address);

    function performBankTransfer(
        address owner,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferCoinToERC20(
        string memory denom,
        uint256 amount
    ) external returns (bool);

    function transferCoinToERC20From(
        string memory denom,
        address owner,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferCoinToERC20To(
        string memory denom,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferERC20ToCoin(
        address token,
        uint256 amount
    ) external returns (bool);

    function transferERC20ToCoinFrom(
        address token,
        address owner,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferERC20ToCoinTo(
        address token,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event CoinCreatedFromErc20(address indexed token, string denom);
    event Erc20CreatedFromCoin(address indexed token, string denom);
    event TransferCoinToErc20(
        address indexed token,
        address indexed owner,
        address indexed recipient,
        Cosmos.Coin coinSent
    );
    event TransferErc20ToCoin(
        address indexed token,
        address indexed owner,
        address indexed recipient,
        Cosmos.Coin coinReceived
    );
}

interface Cosmos {
    struct Coin {
        uint256 amount;
        string denom;
    }
}
