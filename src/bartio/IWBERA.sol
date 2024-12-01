// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

interface IWBERA {
    receive() external payable;

    function DOMAIN_SEPARATOR() external view returns (bytes32 result);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256 result);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address owner) external view returns (uint256 result);

    function decimals() external view returns (uint8);

    function deposit() external payable;

    function name() external pure returns (string memory);

    function nonces(address owner) external view returns (uint256 result);

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function symbol() external pure returns (string memory);

    function totalSupply() external view returns (uint256 result);

    function transfer(address to, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    function withdraw(uint256 amount) external;

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
    event Deposit(address indexed from, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Withdrawal(address indexed to, uint256 amount);
    error AllowanceOverflow();
    error AllowanceUnderflow();
    error ETHTransferFailed();
    error InsufficientAllowance();
    error InsufficientBalance();
    error InvalidPermit();
    error PermitExpired();
    error TotalSupplyOverflow();
}