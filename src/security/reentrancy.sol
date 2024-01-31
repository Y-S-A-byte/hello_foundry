// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

/*
 *  Reentrancy Attackta withdraw fonksiyonu tekrar tekrar çağrılır 
 *  Cross Reentrancy Attack'ta ise aynı fonksiyon yerine başka bir fonkisyon
 çağrılır. Cross Reentrancy'de contratta yapmak istediğiniz işleme göre para harcayabilirsiniz.
 * 
 */
contract singleFunctionReentrancy {
    mapping(address => uint) private userBalances;

    function deposit() external payable {
        userBalances[msg.sender] += msg.value;
    }

    function withdrawBalance() public {
        uint amountToWithdraw = userBalances[msg.sender];
        (bool success, ) = msg.sender.call{value: amountToWithdraw}("");
        require(success);
        userBalances[msg.sender] = 0;
    }
}
