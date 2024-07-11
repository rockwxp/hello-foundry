// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";

contract BankTest is Test {
    Bank public bank;

    function setUp() public {
        bank = new Bank();
    }

    function test_depositETH() public {
        ///
        address _address = vm.addr(
            uint256(keccak256(abi.encodePacked("randomUser", block.timestamp)))
        );

        uint depositAmount = 1 ether;
        uint initBalance = bank.balanceOf(_address);
        vm.deal(_address, depositAmount);
        vm.prank(_address);
        bank.depositETH{value: depositAmount}();

        assertEq(
            bank.balanceOf(_address),
            initBalance + depositAmount,
            "test_depositETH Failed"
        );
    }

    function testFuzz_depositETH(uint256 x) public {
        vm.assume(x > 0);

        address _address = vm.addr(
            uint256(keccak256(abi.encodePacked("randomUser", block.timestamp)))
        );
        vm.deal(_address, x);
        uint256 initBalance = bank.balanceOf(_address);
        vm.prank(_address);
        bank.depositETH{value: x}();

        assertEq(
            bank.balanceOf(_address),
            initBalance + x,
            "testFuzz_depositETH Failed"
        );
    }
}
