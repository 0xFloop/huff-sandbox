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
        vm.deal(msg.sender, 10000 ether);
        console.log("deposits amount below");

        escrow.deposit{value: 1 ether}(0x36280df9BcC006eEfB34998318697E73bCC22048);

        console.log("deposits amount below");

        console.log(escrow.depositsOf(0x36280df9BcC006eEfB34998318697E73bCC22048));
    }

}

