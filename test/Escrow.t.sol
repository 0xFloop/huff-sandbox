// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

interface IEscrow {
    function withdraw() external;
    function deposit(address) external payable;
    function depositsOf(address) external view returns (uint256);
    function owner() external returns (address);
    function setOwner(address) external;
}

contract EscrowTesting is Test {
    IEscrow public escrow;
    address owner = address(0xdead);

    address addr1 = 0xf573d99385C05c23B24ed33De616ad16a43a0919;

    function setUp() public {
        vm.deal(address(owner), 1000 ether);
        escrow = IEscrow(HuffDeployer.deploy_with_args("Escrow", abi.encode(owner)));
        
    }

    function testDeposit() public {
        vm.prank(owner);
        escrow.deposit{value: 1 ether}(addr1);
        assertEq(escrow.depositsOf(addr1), 1 ether);
    }

    function testGetOwnerFromImportedContract() public {
        vm.prank(owner);
        escrow.setOwner(address(0));
    }
}
