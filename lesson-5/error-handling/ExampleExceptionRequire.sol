// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ExampleExceptionRequire {

    mapping(address => uint) public balanceReceived;

     function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        /* if(_amount <= balanceReceived[msg.sender]){
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        } */


        require(_amount <= balanceReceived[msg.sender], "Not enough funds! aborting transaction");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        
    }

}