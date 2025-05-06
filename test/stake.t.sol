// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/proxy-contract/Stake.sol";

contract StakingTestContract is Test {
    StakingContract c;

    function setUp() public {
        c = new StakingContract();
    }

    function testStake() public {
        uint value = 10 ether;
        c.stake{value: value}(value);
        assert(c.totalStake() == value);
    }

    function testUnStake() public {
        uint value = 10 ether;
        c.stake{value: value}(value);
        c.unStake(value);
        assert(c.totalStake() == value / 2);
    }
}