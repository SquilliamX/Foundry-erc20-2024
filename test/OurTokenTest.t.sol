// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract OurTokenTest is Test {
    // Reference to interact with our token contract
    OurToken public ourToken;

    // Reference to our deployment script contract
    // Note: This is just a tool to deploy our token, not the token owner
    DeployOurToken public deployer;

    // Test addresses for our token interactions
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        // Create new instance of deployment script
        deployer = new DeployOurToken();

        // Deploy token using the script
        // Due to vm.broadcast in the deployment script:
        // - msg.sender (this test contract) becomes the owner of all initial tokens
        // - NOT the deployer contract
        ourToken = deployer.run();

        // Transfer tokens to bob for testing
        // This works because the test contract (msg.sender) owns all initial tokens
        vm.prank(address(msg.sender));
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    }

    function testAllowancesWorks() public {
        uint256 initialAllowance = 1000;

        // Bob approves Alice to spend tokens on his behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        // alice transfers bobs tokens from bobs account, to alice, of an amount of 500.
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount);

        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }

    function testTransfer() public {
        // nex transaction will be made by the msg.sender
        vm.prank(msg.sender);
        // transfers tokens from msg.sender to alice of an amount of 100 ether.
        ourToken.transfer(alice, STARTING_BALANCE);

        // assert that the balance of alice is equal to the amount we transferred.
        assertEq(ourToken.balanceOf(alice), STARTING_BALANCE);
    }

    function testBalanceAfterTransfer() public {
        // balance of the msg.sender is saved within a variable of initialBalance.
        uint256 initialBalance = ourToken.balanceOf(msg.sender);
        uint256 transferAmount = 500;

        // nex transaction will be made by the msg.sender
        vm.prank(msg.sender);
        // transfers tokens from msg.sender to alice of an amount of 500 ether.
        ourToken.transfer(alice, transferAmount);

        // assert that the balance of the msg.sender after transferring is equal to the amount he had before transfer subtracted by the amount he sent
        assertEq(ourToken.balanceOf(msg.sender), initialBalance - transferAmount);
        // assert that alice received the funds
        assertEq(ourToken.balanceOf(alice), transferAmount);
    }
}
