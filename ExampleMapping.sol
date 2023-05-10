// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ExampleMapping {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    mapping(uint => mapping(uint => bool)) public myUintUintMapping;
    
    function setValue(uint index) public{
        myMapping[index] = true;
    }

    function setMyAddressToTrue() public{
        myAddressMapping[msg.sender] = true;
    }

    function setMyUintUintMapping(uint _key1, uint _key2) public{
        myUintUintMapping[_key1][_key2] = true;
    }
}