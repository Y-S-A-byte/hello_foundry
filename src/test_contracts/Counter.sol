// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function multipleThreeInt(uint256 a, uint256 b, uint256 c) public pure returns(uint256){
        return a * b * c;
    }

    function increment() public {
        number++;
    }
}
