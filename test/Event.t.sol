// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public e;

    event Transfer(address indexed from, address indexed to, uint amount);

    function setUp() public {
        e = new Event();
    }

    // Notice vm.extectEmit takes 4 parameters, considering first 3 checktopick
    // Notice and the 4th parameter is checkData
    function testEmitTransferEvent() public {
        // 1. Tell Foundry which data to check
        // Check index 1, index 2 and data
        vm.expectEmit(true, true, false, true);

        // 2. Emit the expected event
        emit Transfer(address(this), address(123), 456);

        // 3. Call the function that should emit the event
        e.transfer(address(this), address(123), 456);

        // Check index 1
        vm.expectEmit(true, false, false, false);
        emit Transfer(address(this), address(123), 456);
        e.transfer(address(this), address(777), 999);
    }

    function testEmitManyTransferEvent() public {
        address[] memory to = new address [](2);
        to[0] = address(123);
        to[1] = address(456);

        uint[] memory amounts = new uint[](2);
        amounts[0] = 777;
        amounts[1] = 888;

        for(uint i = 0; i < to.length; i++) {
            // 1. Tell Foundry which data to check
            // 2. Emit the expected event
            vm.expectEmit(true, true, false, true);
            emit Transfer(address(this), to[i], amounts[i]);
        }

        // 3. Call the function that should emit the event

        e.transferMany(address(this), to, amounts);
    }
}
