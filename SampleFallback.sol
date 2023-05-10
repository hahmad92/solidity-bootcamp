// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract SampleFallback {
    string public lastFunctionCalled;
    uint public lastValueSent;

    uint public myUnit;
    

    receive() external payable{
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }
    fallback() external payable{
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}