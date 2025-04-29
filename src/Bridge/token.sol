// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract token is ERC20 {

    address private owner;
    modifier onlyOwner(){
        require(owner == msg.sender,"not an owner");
        _;
    }
     constructor(uint256 _initialValue) ERC20 ( "token","TOK"){}

     function tokenName() public view returns (string memory){
        return name();
    }
    
    function mint(address to, uint256 _amount) public onlyOwner {
        _mint(to, _amount);
    }


}

