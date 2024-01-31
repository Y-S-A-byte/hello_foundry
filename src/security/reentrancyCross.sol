// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

/*
    Temel mimari chehcks, effects, interactions sıralamasına uymaktır.
    Checks  : reqire gibi kontrollerin yapıldığı yer
    Effects : cüzdanlar üzerindeki manipülasyonlar
    Require : ise başka bir cüzdan ile iletişime geçmektir.
    ReentrancyGuard ile de kullanılması istenmeyen methodlar locklanabilir!
 */

contract crossFunctionReentrancy {
    mapping(address => uint) private userBalances;

    function transfer(address to, uint amount) external {
        if (userBalances[msg.sender] >= amount) {
            userBalances[to] += amount;
            userBalances[msg.sender] -= amount;
        }
    }

    function withdrawBalance() public {
        uint amountToWithdraw = userBalances[msg.sender];
        (bool success, ) = msg.sender.call{value: amountToWithdraw}("");
        require(success); // checks
        userBalances[msg.sender] = 0; // affect
    }
}
