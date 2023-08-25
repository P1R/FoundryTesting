pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract ConsoleTest is Test {
    function testLogSomething() public {
        console.log("Log something here", 567);
    int x = -1;
    console.logInt(x);
    }

}
