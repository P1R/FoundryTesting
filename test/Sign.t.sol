// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract signTest is Test {
    // private key = 123
    // public key = vm.addr(private key)
    // message = "secret message"
    // message hash = keccak256(message)
    // vm.sign(private key, message hash)

    function testSignature() public {
        uint privateKey = 123;
        address pubKey = vm.addr(privateKey);

        bytes32 messageHash = keccak256("secret message");

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, messageHash);

        address signer = ecrecover(messageHash, v, r, s);

        assertEq(pubKey, signer);

        bytes32 invalidMessageHash = keccak256("invalid Message");

        signer = ecrecover(invalidMessageHash, v, r, s);
        
        assertTrue(signer != pubKey);
    }

}
