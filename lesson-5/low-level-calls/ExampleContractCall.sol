// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract ContractOne {
    mapping(address => uint) public accountBalances;

     function deposit() public payable {
        accountBalances[msg.sender] += msg.value;
    }

  
}

contract ContractOneWithDefault {
    mapping(address => uint) public accountBalances;

     function deposit() public payable {
        accountBalances[msg.sender] += msg.value;
    }
    receive() external payable{
        deposit();
    }

  
}

contract ContractTwo {

    //If you know the defination of the smart contract.
    function balance() public view returns(uint){
        return address(this).balance;
    }

    function depositInContractOne(address _contractOne) public{
        ContractOne one = ContractOne(_contractOne);
        one.deposit{value: 10, gas: 100000}();
    }

    receive() external payable{
    }
}

contract ContractThree {

    //If you know the signature of the function.
    function balance() public view returns(uint){
        return address(this).balance;
    }

    function depositInContractOne(address _contractOne) public{
        bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool isSent, ) = _contractOne.call{value: 10, gas: 100000}(payload);
        require(isSent, "Transaction Failed!");
    }

    receive() external payable{
    }
}

contract ContractFour{

    //If you know nothing about the address.
    function balance() public view returns(uint){
        return address(this).balance;
    }

    function depositInContractOne(address _contractOne) public{
        //bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool isSent, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(isSent, "Transaction Failed!");
    }

    receive() external payable{
    }
}