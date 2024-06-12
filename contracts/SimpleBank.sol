// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    mapping(address => uint256) private balances;

    // Event for logging deposits
    event Deposit(address indexed user, uint256 amount);

    // Event for logging withdrawals
    event Withdraw(address indexed user, uint256 amount);

    // Deposit funds into the bank
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Withdraw funds from the bank
    function withdraw(uint256 amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }

    // Check the balance of the caller
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
