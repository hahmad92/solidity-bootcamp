// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ExampleExceptionAssert {

    mapping(address => uint8) public balanceReceived;

     function receiveMoney() public payable {
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable _to, uint8 _amount) public{

        require(_amount <= balanceReceived[msg.sender], "Not enough funds! aborting transaction");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        
    }
}