// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
/* 
    fallback funtion -> It is catchall funtion. since we cannot add a new fn to a proxy contract as we 
    will need to redploy it so if we want to add a new feature to a contract how can we do that?
    there comes the fallback funtion. lets say in a new version of implemetation contract we have 
    added a new fn getNum(). so in order to pass it to the proxy contract contract we will need a fallback
    fn in the same. the setNum fn will be caught by the selector fn present in the proxy contract,
    but any other funtion that didnt match the selector fn  will be caught by the fallback fn.
 */

contract storagrProxy{
    uint public num;
    address implementation;

    constructor(address _implementation){
        implementation = _implementation;
    } 

    fallback() external {
        (bool success,) = implementation.delegatecall(msg.data);

        if(!success){
            revert();
        }
    }
}

contract Implementationv2 {
    uint public num;

    function setNum(uint _num) public {
        num = _num * 2;
    }
}





