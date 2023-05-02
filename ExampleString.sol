// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ExampleStrings {
    string public myString = "Hammad";
    bytes public myByte = "Hammad";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    function setMyBytes(bytes memory _myByte) public {
        myByte = _myByte;
    }
    
    function compareTwoStrings(string memory _myString) public view returns(bool){
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }

    function compareTwoBytes(bytes memory _myByte) public view returns(bool){
        return keccak256(myByte) == keccak256(_myByte);
    }
}