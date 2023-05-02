// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ExampleAddress {
    address public someAddress;

    function setAddress(address _someAddress) public {
        someAddress = _someAddress;
    }
    
    function getBalance() public view returns(uint){
        return someAddress.balance;
    }
}