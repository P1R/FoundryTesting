// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract CounterTest is Test {
    HelloWorld public helloWorld;

    function setUp() public {
        helloWorld = new HelloWorld();
    }

    function testGreet() public {
        assertEq(helloWorld.greet(), "Hello World!");
    }
}
