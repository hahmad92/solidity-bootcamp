// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ExampleConstructor {
    address public myAddress;

    constructor(address _myAddress){
        myAddress = _myAddress;
    }

    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function setMyAddressToMsgSender() public {
        myAddress = msg.sender;
    }
}