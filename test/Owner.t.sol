// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {Owner} from "../src/Owner.sol";

contract OwnerTest is Test {
    Owner ownerContracts;
    address constant myMetamaskAddress = 0xF773D5d91b0a8d002962AEe17014167C621a0170;
    address constant IMPORT_ADDRESS_OWNER = 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496;
    

    // Her test işlemi gerçekleştiğinde çalışır. Hardhat foreach gibi düşünülebilir.
    function setUp() public {
        ownerContracts = new Owner();
    }

    function testOwnerisOwn() public {
        assertEq(ownerContracts.getOwner(),IMPORT_ADDRESS_OWNER);
    }

    function testChangeOwner() public {
        ownerContracts.changeOwner(myMetamaskAddress);
        assertEq(ownerContracts.getOwner(), myMetamaskAddress);
    }
}
