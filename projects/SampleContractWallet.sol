// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract SampleContractWallet {

    address payable owner;
    mapping(address => uint) allowance;
    mapping(address => bool) isAllowedToSend;

    constructor(){
        owner = payable(msg.sender);
    }

    //To receive funds from external accounts aka addresses and other smart contracts
    receive()external payable{}


    function transfer(address payable _to, uint _amount, bytes memory  _payload) public  returns(bytes memory){

        if(msg.sender != owner){
            require(allowance[msg.sender] >= _amount, "You are sending more than you are allowed to, Aborting Transaction!");
            require(isAllowedToSend[msg.sender], "You are not allowed to send anything from this contract, Aborting Transaction!");

            allowance[msg.sender] -= _amount;
        }
        if(msg.sender == owner){
            require(_amount <= address(this).balance, "Can't send more than the contract owns, aborting.");
            (bool success,bytes memory message ) = _to.call{value: _amount}(_payload);
            require(success, "Transaction failed, aborting");
            return message;
        }
    }

    function setAllowance(address _for, uint _amount)public {
        require(msg.sender == owner, "You are not the nownver, Aborting!");
        allowance[_for] = _amount;
    }
}