// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {console} from 'forge-std/console.sol';
contract leviCoin is ERC20 {
    constructor(uint256 _initialValue) ERC20 ("levi" ,"LCO"){
        
    }
    function mint(address to, uint amount) public {
         console.log("hey");
        _mint(to,amount);

    }
    
}