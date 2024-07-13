// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract DeployMyToken is Script {
    function run() external {
        vm.startBroadcast();

        // deploy contract
        MyToken myToken = new MyToken("MyToken", "MTK");

        vm.stopBroadcast();
    }
}
