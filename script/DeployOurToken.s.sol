// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "lib/forge-std/src/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract DeployOurToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    // we do not need a helperConfing to choose different chains because our token is always going to be the same no matter what EVM compatible chain we deploy to.

    function run() external returns (OurToken) {
        vm.startBroadcast();
        // Deploying the OurToken with an initial supply because the OurToken constructor takes an initial supply parameter.
        OurToken ot = new OurToken(INITIAL_SUPPLY); // the msg.sender that deploys this script gets the 1000 tokens
        vm.stopBroadcast();
        return ot;
    }
}
