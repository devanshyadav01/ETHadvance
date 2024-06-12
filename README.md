# Eth_error_prblm
# Project Title

Simple Error Handling in Solidity Smart Contract using calculator 

## Description
This project demonstrates a simple Solidity smart contract designed to perform basic arithmetic operations while showcasing the use of error handling mechanisms: require(), assert(), and revert(). These mechanisms ensure the contract's correctness by validating conditions before executing operations.

## Getting Started

### Installing
Installing
To deploy and interact with this contract, you will need:

1.A development environment like Remix IDE or a local setup using Hardhat or Truffle.

2. A browser extension like Phantom for interacting with the Ethereum network.


### Executing program

Follow these steps to deploy and interact with the contract:

1.Open Remix IDE:

a.Navigate to Remix IDE.

b.Create a new file and paste the contract code provided.

2.Compile the Contract:

a.Select the appropriate Solidity compiler version (0.8.0 or higher).

b.Compile the contract by clicking the "Compile" button.

3.Deploy the Contract:

a.Go to the "Deploy & Run Transactions" tab.

b.Select the environment (e.g., JavaScript VM for local testing or Injected Web3 for using MetaMask).

c.Deploy the contract by clicking the "Deploy" button.

4.Interact with the Contract:

a.Once deployed, the contract's functions will be available in the Remix interface.

b.Use the input fields to call functions like add, subtract, multiply, divide, and reset.


// To add two numbers
add(5, 3);

// To subtract two numbers
subtract(10, 4);

// To multiply two numbers
multiply(6, 7);

// To divide two numbers
divide(20, 5);

// To reset the result
reset();



## Help

For common issues, consider the following:

1.Compilation Errors: Ensure you are using the correct Solidity version (0.8.0 or higher).

2.Deployment Issues: Check your network configuration and ensure you have sufficient funds in your MetaMask account for gas fees.

3.Function Errors: Review the function requirements and error messages. For example, division by zero will trigger a revert() with a custom message.

## Authors

Contributors names and contact info

Devansh Satsangi
[devanshyadav566@gmail.com]


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
