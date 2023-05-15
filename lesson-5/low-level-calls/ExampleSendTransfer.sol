// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract Sender {
    receive() external payable{
    }

    function withdrawUsingTransfer(address payable _to) public{
        _to.transfer(10);
    }

    function withdrawUsingSend(address payable _to) public{
        bool isSent = _to.send(10);
        require(isSent, "Transaction Failed!");
    }
}

contract ReceiverWithNoAction {

    function balance() public view returns(uint){
        return address(this).balance;
    }

    receive() external payable{
    }
}

contract ReceiverWithAction {

    uint public balanceReceived;

    function balance() public view returns(uint){
        return address(this).balance;
    }
    
    receive() external payable{
        balanceReceived += msg.value;
    }

}