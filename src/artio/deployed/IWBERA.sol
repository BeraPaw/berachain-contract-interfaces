// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

interface IWBERA {
    receive() external payable;

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function decimals() external view returns (uint8);

    function deposit() external payable;

    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function withdraw(uint256 amount) external;

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Deposit(address indexed from, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Withdrawal(address indexed to, uint256 amount);
    error ERC20InsufficientAllowance(
        address spender,
        uint256 allowance,
        uint256 needed
    );
    error ERC20InsufficientBalance(
        address sender,
        uint256 balance,
        uint256 needed
    );
    error ERC20InvalidApprover(address approver);
    error ERC20InvalidReceiver(address receiver);
    error ERC20InvalidSender(address sender);
    error ERC20InvalidSpender(address spender);
}
