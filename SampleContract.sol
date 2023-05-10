// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract SampleContract {
    string public myString = "Hello!";

   function updateMyString(string memory _myString) public payable {
       if(msg.value == 1 ether){
           myString = _myString;
       }else{
           payable(msg.sender).transfer(msg.value);
       }
        
    }
}