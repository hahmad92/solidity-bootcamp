// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract TheBlockchainMessanger {

    string public theMessage;

    address public owner;

    uint public counter;

    constructor(){
        owner = msg.sender;
    }

    function updateTheMessage(string memory _theMessage) public {
        if(msg.sender == owner){
            counter++;
            theMessage = _theMessage;
        }
    }
}