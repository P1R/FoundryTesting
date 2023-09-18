// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Error {
    error NotAuthorized();

    function throwError() external {
        require(false, "not authorized");
    }

    function throwCustomError() external {
        revert NotAuthorized();
    }


}
