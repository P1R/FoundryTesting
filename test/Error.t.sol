// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract ErrorTest is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    function testFail() public {
        err.throwError();
    }

    // Does the same test as above
    function testRevert() public {
        vm.expectRevert();
        err.throwError();
    }

    // Test with require error message
    function testRequireMessage() public {
        vm.expectRevert(bytes("not authorized"));
        err.throwError();
    }

    // Test custom error
    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomError();
    }

    // Test Error Label
    function testErrorLabel() public {
        assertEq(uint(1), uint(1), "test 1");
        assertEq(uint(1), uint(1), "test 2");
        assertEq(uint(1), uint(1), "test 3");
        assertEq(uint(1), uint(1), "test 4");
        // assertEq(uint(0), uint(2), "test 5");
    }
    
}
