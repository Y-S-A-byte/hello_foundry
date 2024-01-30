// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    // Her test işlemi gerçekleştiğinde çalışır. Hardhat foreach gibi
    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    // Tahmin edilen değerlerin doğru sonuç vermesi için test keywordu kullanılır.
    function testCounter() public {
        uint256 x = counter.multipleThreeInt(8, 7, 2);
        assertEq(x, 112);
    }

    // Tahmin edilen değerin yanlış sonuç vermesi isteniyorsa testFail keywordu kullanılır.
    function testFailCounter() public {
        uint256 y = counter.multipleThreeInt(6, 2, 2);
        assertEq(y, 20);
    }
}
