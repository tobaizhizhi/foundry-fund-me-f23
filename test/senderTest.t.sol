/* // SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Test.sol";

contract Target {
    function who() external view returns (address, address) {
        return (msg.sender, address(this));
    }
}

contract SenderTest is Test {
    Target target;

    function setUp() public {
        target = new Target();
    }

    function testCompareSenders() public {
        console.log("========== Test: Inside Test Function ==========");
        console.log("msg.sender (test runner) =", msg.sender);
        console.log("address(this) (test contract) =", address(this));
        console.log("-----------------------------");

        console.log("========== External Call to target.who() ==========");
        (address sender, address self) = target.who();
        console.log("target.who() -> msg.sender =", sender);
        console.log("target.who() -> address(this) =", self);
        console.log("-----------------------------");

        console.log("========== After vm.prank ==========");
        vm.prank(address(uint160(0x999)));
        (address sender2, ) = target.who();
        console.log("vm.prank(0x999) -> msg.sender =", sender2);
        console.log("-----------------------------");
    }
} */