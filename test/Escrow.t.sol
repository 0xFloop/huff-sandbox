// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;
import { HuffDeployer } from "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

interface IEscrow {
    function withdraw() external;
    function deposit(address) external payable;
    function depositsOf(address) external view returns (uint256);
}

contract EscrowTesting is Test {
    /// @dev Address of the SimpleStore contract.
    IEscrow public escrow;

    /// @dev Setup the testing environment.
    function setUp() public {
        escrow = IEscrow(HuffDeployer.deploy("Escrow"));
    }
    function testDeposit() public {
        escrow.deposit{value: 22222}(msg.sender);
        console.log("deposits amount below");
        console.log(escrow.depositsOf(msg.sender));
    }
    function testFunction( ) public {
        uint256 value = escrow.depositsOf(msg.sender);
        console.log("hello");
    }
}

