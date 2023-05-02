// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ExampleViewPure {
    uint public myStorageVariable;

    function getMyStorageVariable() public view returns(uint){
        return myStorageVariable;
    }

    function getMyStorageVariable(uint a, uint b) public pure returns(uint){
        return a + b;
    }

    function setMyStorageVariable(uint _myStorageVariable) public {
        myStorageVariable = _myStorageVariable;
    }
}