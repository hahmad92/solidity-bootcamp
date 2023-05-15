// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract willThrow{
    error NotAllowedError(string);
    function errorFunction() pure public{
        //require(false, "Require error message!");
        revert NotAllowedError("Hey! you are not allowed to perform this action.");
    }
}

contract willThrowPanic{
    function errorFunction() pure public{
        assert(false);
    }
}

contract ErrorHandling{


    event ErrorLogging(string reason);
    event ErrorCodeLogging(uint reason);
    event ErrorBytesLogging(bytes lowLevelData);

    function catchTheError() public{
        willThrow obj = new willThrow();

        //willThrowPanic obj1 = new willThrowPanic();
        
        try obj.errorFunction(){

        }catch Error(string memory reason){
            emit ErrorLogging(reason);
        }catch Panic(uint errorCode){
            emit ErrorCodeLogging(errorCode);
        }catch (bytes memory lowLevelData){
            emit ErrorBytesLogging(lowLevelData);
        }
    }

}