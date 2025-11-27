// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Tokenized Energy Trading
 * @dev A simplified contract representing energy tokenization,
 *      allowing users to mint energy tokens and trade them.
 */
contract Project {
    mapping(address => uint256) public energyBalance;

    /// @notice Mint energy tokens (representing kWh)
    /// @param amount The amount of energy tokens to mint
    function mintEnergy(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        energyBalance[msg.sender] += amount;
    }

    /// @notice Transfer energy tokens to another user
    /// @param to The receiving address
    /// @param amount The number of tokens to transfer
    function transferEnergy(address to, uint256 amount) external {
        require(to != address(0), "Invalid recipient");
        require(energyBalance[msg.sender] >= amount, "Insufficient balance");

        energyBalance[msg.sender] -= amount;
        energyBalance[to] += amount;
    }

    /// @notice Check your energy token balance
    /// @param user The address to check
    /// @return balance The energy token balance
    function getEnergyBalance(address user) external view returns (uint256 balance) {
        return energyBalance[user];
    }
}

