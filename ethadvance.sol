// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    int private result;

    // Event to log the result of calculations
    event CalculationResult(int result);

    // Adds two numbers and updates the result
    function add(int a, int b) public returns (int) {
        result = a + b;
        emit CalculationResult(result);
        return result;
    }

    // Subtracts the second number from the first and updates the result
    function subtract(int a, int b) public returns (int) {
        result = a - b;
        emit CalculationResult(result);
        return result;
    }

    // Multiplies two numbers and updates the result
    function multiply(int a, int b) public returns (int) {
        result = a * b;
        emit CalculationResult(result);
        return result;
    }

    // Divides the first number by the second and updates the result
    // Uses require() to ensure the divisor is not zero
    function divide(int a, int b) public returns (int) {
        require(b != 0, "Division by zero is not allowed");
        result = a / b;
        emit CalculationResult(result);
        return result;
    }

    // Resets the result to zero
    // Uses assert() to ensure the result is zero after reset
    function reset() public {
        result = 0;
        assert(result == 0); // Should always be true after reset
        emit CalculationResult(result);
    }

    // Calculates the modulo of the first number by the second and updates the result
    // Uses revert() if the divisor is zero
    function mod(int a, int b) public returns (int) {
        if (b == 0) {
            revert("Modulo by zero is not allowed");
        }
        result = a % b;
        emit CalculationResult(result);
        return result;
    }

    // Returns the current result
    function getResult() public view returns (int) {
        return result;
    }
}
