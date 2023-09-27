// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function testSetOwner() public {
        console.log("wallet Owner Before:", wallet.owner());
        wallet.setOwner(address(1));
        console.log("wallet Owner After:", wallet.owner());
        assertEq(wallet.owner(),address(1));
    }

    function testFailNotOwner() public {
        console.log("wallet Owner Before:", wallet.owner());
        vm.prank(address(1));
        wallet.setOwner(address(1));
    }

    function testFailSetOwnerAgain() public {
        // msg.sender = address(this)
        wallet.setOwner(address(1));

        vm.startPrank(address(1));

        // msg.sender = address(1)
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));

        vm.stopPrank();

        // msg.sender = address(this)

        wallet.setOwner(address(1));
        
    }
}
