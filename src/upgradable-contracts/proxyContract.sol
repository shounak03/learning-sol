// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//proxy contract = delegating call here w context

/*
    when the storage contract is deployed w the address of implementation contract,the imp contract is the logic contr
    Strage delegates a call to the imp contract while maintaining the context of the storage contr.
    due to this if we update the num in storage contr that doesnt change the num in imp contract.
    this way we can have different impl contract as the example, and by simply passing the implementation versions we can 
    change the logic of the storage contr. hence Storage contr doesnt need to be redeployed and we can upgrade it. 

    state recides over here...

    problems w the current proxy --> cannot add new fn in proxy, should be created upfront. thats why we need fallback function
    check the betterProxyContract.sol
*/

contract StorageProxy {
    uint public num; // storage slot 1, the storage slot should match the proxy and imp contracts
    address implementation;
    address owner;
   
    constructor(address _implementation) { // passing the imp version address
        num = 0;
        implementation = _implementation;
    }
    

    function setNum(uint _num) public { //making the delegate call
        (bool success, ) = implementation.delegatecall(
            abi.encodeWithSignature("setNum(uint256)", _num)
        );
        require(success, "Error while delegating call");
    }

    function setImplementation(address _implementation) public { //setting the version of implementation
        implementation = _implementation;
    }
}


//different implementations ---> logic recides here

contract Implementationv1 {
    uint public num; // storage slot 1

    function setNum(uint _num) public {
        num = _num;
    }
}
/* below is a wrong implementation, as the first storage slot is for the string but in proxy contract it is for the num(uint) 
    due to this the setnum fun wouldnt update the variable, matching the slot is very important here, there should be a consitant storage
    layout that should be consistantly followed through the code.  
*/
contract Implementationv2 {
    string public abc;
    uint public num;

    function setNum(uint _num) public {
        num = _num * 2;
    }
}

contract Implementationv3 {
    uint public num;

    function setNum(uint _num) public {
        num = _num * 3;
    }
}

