// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import  "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract StakingContract{

    mapping(address => uint) pendingBalance; 
    uint public totalStake;
    constructor() {

    }
   
    function stakeV1(uint _amount) public payable {
        require(_amount > 0,"Not enough Etherium");
        require(_amount == msg.value);
        pendingBalance[msg.sender] += _amount;
        totalStake+=_amount;
    }

    function unStakeV1(uint _amount) public {
        require(pendingBalance[msg.sender] >= _amount);
        payable(msg.sender).transfer(_amount);
        totalStake -= _amount;
        pendingBalance[msg.sender] -= _amount;
    }

}

contract storagrProxy{
   mapping(address => uint) pendingBalance; 
    uint public totalStake;
    address public implementation;

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
