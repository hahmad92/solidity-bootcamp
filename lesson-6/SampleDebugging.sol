// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract MyContract {

    uint public myUint = 123;

    function setMyUint(uint newUint) public{
        myUint = newUint;
    }
}