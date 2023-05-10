// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ExampleMappingWithdrawals {

    mapping(address => uint) public balancedReceived;

    function sendMoney() public payable {
        balancedReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
     function withdrawAllMoney(address payable to) public {

        //This method works but it has security flaw as, transfer method can take time and if the user
        //call this method than a second transfer will occure before we set the balance to 0;
        //Safe Function is a better way to do this.
        to.transfer(getBalance());
        balancedReceived[msg.sender] = 0;
    }


    function withdrawAllMoneySafe(address payable to) public {
        uint balanceToSendOut = balancedReceived[msg.sender];
        balancedReceived[msg.sender] = 0;
        to.transfer(balanceToSendOut);
    }
}