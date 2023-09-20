// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

contract Event {
    event Transfer(address indexed from, address indexed to, uint amount);

    function transfer(address from, address to, uint amount) external {
        emit Transfer(from, to, amount);
    }

    function transferMany(address from, address[] calldata to, uint[] calldata amounts) external {
        for(uint i = 0; i < to.length; i++) {
            emit Transfer(from, to[i], amounts[i]);
        }
    }
}
