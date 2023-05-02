// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ExampleMsgSender {
    address public someAddress;

    function setSomeAddress() public {
        someAddress = msg.sender;
    }
}