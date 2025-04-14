// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {S1SolutionHelper} from "../src/S1SolutionHelper.sol";
import {console} from "forge-std/console.sol";

contract SolveS1 is Script {
    function run() external {
        address helperContractAddress = 0x6E6Fe04023Fa82465418FE1b821134C039e44D2b;
        S1SolutionHelper encoder = new S1SolutionHelper();

        // Get and log selector
        bytes4 selector = encoder.returnSelectorOne();
        console.log("Selector (bytes4):");
        console.logBytes4(selector);

        // Get and log encoded input data
        bytes memory inputData = encoder.returnInputData(helperContractAddress);
        console.log("Input Data (bytes):");
        console.logBytes(inputData);
    }
}