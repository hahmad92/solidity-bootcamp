// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract Wallet {
    PaymentReceived public paymentReceived;

    function payContract() public payable {
        paymentReceived  = new PaymentReceived(msg.sender, msg.value);
    }
}


contract PaymentReceived{
    address public from;
    uint public amount;

    constructor(address _from, uint _amount){
        from = _from;
        amount = _amount;
    }
}


contract Wallet2 {
    
    struct PaymentReceivedStruct{
        address from;
        uint amount;
    }

    
    PaymentReceivedStruct public paymentReceivedStruct;

    function payContract() public payable {
        paymentReceivedStruct = PaymentReceivedStruct(msg.sender, msg.value);
    }
}