// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {console} from 'forge-std/console.sol';

contract LockUSDT{

    mapping(address => uint256) pendingAmount;

    address private usdtAddress;
    constructor(address _usdtAddress){
        usdtAddress = _usdtAddress;
    }
    function deposit(uint256 _amount) public{
        require(IERC20(usdtAddress).allowance(msg.sender, address(this)) >= _amount);
        IERC20(usdtAddress).transferFrom(msg.sender, address(this), _amount);
        pendingAmount[msg.sender] += _amount;
        
    }
    function withdraw() public {
        uint256 remaining = pendingAmount[msg.sender];
        IERC20(usdtAddress).transfer(msg.sender, remaining);
        pendingAmount[msg.sender] = 0;
    }
} 