// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarRentalSystem {
    address public owner;
    uint256 public totalAvailableCars;

    struct Car {
        uint256 id;
        string name;
        bool available;
    }

    mapping(uint256 => Car) public cars;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
        totalAvailableCars = 0;
    }

    function addCar(uint256 _id, string memory _name) public onlyOwner {
        require(_id > 0, "Car ID must be greater than zero");
        require(bytes(_name).length > 0, "Car name cannot be empty");
        require(cars[_id].id == 0, "Car with this ID already exists");

        cars[_id] = Car({
            id: _id,
            name: _name,
            available: true
        });

        totalAvailableCars += 1;
    }

    function rentCar(uint256 _id) public {
        require(cars[_id].id != 0, "Car with this ID does not exist");
        require(cars[_id].available, "Car is not available for rent");

        cars[_id].available = false;
        totalAvailableCars -= 1;

        // Assert the car is marked as unavailable and totalAvailableCars is updated
        assert(!cars[_id].available);
        assert(totalAvailableCars >= 0);
    }

    function returnCar(uint256 _id) public {
        require(cars[_id].id != 0, "Car with this ID does not exist");
        require(!cars[_id].available, "Car is already available");

        cars[_id].available = true;
        totalAvailableCars += 1;

        // Assert the car is marked as available and totalAvailableCars is updated
        assert(cars[_id].available);
        assert(totalAvailableCars > 0);
    }

    function getCarDetails(uint256 _id) public view returns (string memory, bool) {
        require(cars[_id].id != 0, "Car with this ID does not exist");
        Car memory car = cars[_id];
        return (car.name, car.available);
    }

    function _handleError(string memory _errorMessage) internal pure returns (string memory) {
        return _errorMessage;
    }

    function exampleErrorHandling(uint256 _id) external view {
        if (cars[_id].id == 0) {
            revert(_handleError("Car with this ID does not exist"));
        }
    }
}
