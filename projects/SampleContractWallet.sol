// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract SampleContractWallet {

    address payable owner;

    mapping(address => uint) allowance;
    constructor(){
        owner = payable(msg.sender);
    }

    receive()external payable{}

    function transfer(address payable _to, uint _amount, bytes memory  _payload) public  returns(bytes memory){

        if(msg.sender == owner){
            require(_amount <= address(this).balance, "Can't send more than the contract owns, aborting.");
            (bool isSent,bytes memory message ) = _to.call{value: _amount}(_payload);
            require(isSent, "Transaction failed, aborting");
            return message;
        }

    }

}