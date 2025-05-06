// // SPDX-License-Identifier: Unlicense
// pragma solidity ^0.8.13;

// import "forge-std/Test.sol";

// import "src/BridgeContract/leviCoin.sol";

// contract TestLeviCoin is Test {
//     event Transfer(address indexed from, address indexed to, uint256 value);
//     leviCoin c;

//     function setUp() public {
//         c = new leviCoin(10);
//     }

//     function testMint() public {
       
//         c.mint(address(this),10);
//         assertEq(c.balanceOf(address(this)),10,"ok");
//         c.mint(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d,50);
//         assertEq(c.balanceOf(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d),50,"ok");
//     }


//     function testTransfer() public {
//         c.mint(address(this),10);
//         c.transfer(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d,5);
//         assertEq(c.balanceOf(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d),5,"ok");
//         vm.prank(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d);
//         c.transfer(address(this),3);
//         assertEq(c.balanceOf(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d),2,"ok");
//         assertEq(c.balanceOf(address(this)),8,"ok");
//         // vm.prank(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d);

//     }
//     function testApproval() public {
//         c.mint(address(this),100);
//         c.approve( 0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d, 30);
//         vm.prank(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d);
//         c.transferFrom(address(this),0xCc0b429216b4367C16b745Dc9737bCf3408c2B06,20);
//         assertEq(c.balanceOf(address(this)),80,"ok");
//         assertEq(c.balanceOf(0xCc0b429216b4367C16b745Dc9737bCf3408c2B06),20,"ok");

//     }
//     // function testRevertApproval() public{
//     //     c.mint(address(this),100);
//     //     c.approve( 0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d, 30);
//     //     vm.prank(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d);
//     //     c.transferFrom(address(this),0xCc0b429216b4367C16b745Dc9737bCf3408c2B06,50);
//     // }
//     function testEmit() public{
//         c.mint(address(this),100);
//         vm.expectEmit(true,true,false,true);
//         emit Transfer(address(this),0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d,5);
//         c.transfer(0xF40e1B6A63621Cb5F9b64cD766E3D465648B5C3d,5);     
//     }
// }
