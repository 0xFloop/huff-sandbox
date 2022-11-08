// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

interface IEscrow {
    function withdraw() external;
    function deposit(address) external payable;
    function depositsOf(address) external view returns (uint256);
    function owner() external view returns (address);
}

contract EscrowTesting is Test {
    IEscrow public escrow;

    function setUp() public {
        vm.deal(msg.sender, 10000 ether);

        escrow = IEscrow(HuffDeployer.deploy("Escrow"));
    }

    function testDeposit() public {
        escrow.deposit{value: 1 ether}(0xf573d99385C05c23B24ed33De616ad16a43a0919);

        console.log("deposits amount below");

        console.log(escrow.depositsOf(0xf573d99385C05c23B24ed33De616ad16a43a0919));
    }

    function testGetOwnerFromImportedContract() public {
        address owner = escrow.owner();
        console.log(owner);
    }
}
