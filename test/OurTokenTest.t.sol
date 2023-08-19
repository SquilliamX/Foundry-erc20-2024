// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(msg.sender);
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    }

    function testAllowancesWorks() public {
        uint256 initialAllowance = 1000;

        //bob approves alice to spend tokens on his behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount);

        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }

    function testTransfers() public {
        uint256 amount = 100;
        vm.prank(msg.sender);
        ourToken.transfer(alice, amount);

        assertEq(
            ourToken.balanceOf(address(this)),
            deployer.INITIAL_SUPPLY() - amount
        );
        assertEq(ourToken.balanceOf(alice), amount);

        vm.prank(alice);
        ourToken.transfer(bob, amount / 2);
        assertEq(ourToken.balanceOf(alice), amount / 2);
        assertEq(ourToken.balanceOf(bob), amount / 2);
    }

    function testBalanceOf() public {
        assertEq(ourToken.balanceOf(address(this)), deployer.INITIAL_SUPPLY());
    }

    function testTransferExceedingBalance() public {
        vm.expectRevert();

        uint256 excessiveAmount = deployer.INITIAL_SUPPLY() + 1;
        ourToken.transfer(alice, excessiveAmount);
    }

    function testApproveAndTransferFromExceedingAllowance() public {
        uint256 amount = 100;
        uint256 excessiveAmount = amount + 1;

        ourToken.approve(alice, amount);

        vm.prank(alice);
        vm.expectRevert();

        ourToken.transferFrom(address(this), bob, excessiveAmount);
    }
}
