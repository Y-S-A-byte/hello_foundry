// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract CheatCodes {
    address hans = address(0xBEEF);

    function fPrank() public view returns (bool) {
        require(msg.sender == hans);
        return true;
    }

    function fDeal() public view returns (bool) {
        require(msg.sender.balance == 5 ether);
        return true;
    }

    function fWarp() public view returns (bool) {
        require(block.timestamp > 50000000);
        return true;
    }

    function fRoll() public view returns (bool) {
        require(block.number > 5000000);
        return true;
    }

    function fPrankTxOrigin() public view returns (bool) {
        require(tx.origin == hans);
        return true;
    }
}
