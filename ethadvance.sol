// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    int private result;

    // Event to log the result of calculations
    event CalculationResult(int result);
    event ErrorOccurred(string errorMessage);

    // Adds two numbers and updates the result
    // Demonstrates require() by checking for overflow conditions
    function add(int a, int b) public returns (int) {
        require(a <= type(int).max - b, "Addition overflow");
        result = a + b;
        emit CalculationResult(result);
        return result;
    }

    // Subtracts the second number from the first and updates the result
    // Demonstrates require() by checking for underflow conditions
    function subtract(int a, int b) public returns (int) {
        require(a >= type(int).min + b, "Subtraction underflow");
        result = a - b;
        emit CalculationResult(result);
        return result;
    }

    // Multiplies two numbers and updates the result
    // Demonstrates require() by checking for overflow conditions
    function multiply(int a, int b) public returns (int) {
        require(b == 0 || a * b / b == a, "Multiplication overflow");
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

    // Resets the result to zero
    // Uses assert() to ensure the result is zero after reset
    function reset() public {
        result = 0;
        assert(result == 0); // Should always be true after reset
        emit CalculationResult(result);
    }

    // Returns the current result
    function getResult() public view returns (int) {
        return result;
    }

    // Additional function to demonstrate require() with a custom condition
    function checkPositive(int a) public pure returns (int) {
        require(a > 0, "The number must be positive");
        return a;
    }

    // Additional function to demonstrate assert() with a condition that should never fail
    function checkInvariant() public view returns (int) {
        // Asserts that the result should never be negative as per our logic
        // This is an example and may not be universally true in all contexts
        assert(result >= 0);
        return result;
    }

    // Additional function to demonstrate revert() in an unexpected scenario
    function unexpectedRevert() public pure {
        // Example scenario where a revert is triggered for unexpected conditions
        revert("This function always reverts unexpectedly");
    }

    // Function to demonstrate error handling
    function demoErrorHandling() view public {
        // Example of deliberate error handling
        if (result == 42) {
            revert("The answer to everything is not allowed");
        } else if (result < 0) {
            require(result >= 0, "Result should never be negative");
        } else {
            assert(result != 13); // Example of a condition that should never be true
        }
    }
}
