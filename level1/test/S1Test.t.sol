// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {S1} from "../src/S1.sol";
import {S1Helper} from "../src/S1Helper.sol";
import {S1SolutionHelper} from "../src/S1SolutionHelper.sol";
import {Challenge} from "../src/Challenge.sol";
import {ICTFRegistry} from "../src/ICTFRegistry.sol";

contract S1Test is Test {
    S1 s1;
    S1Helper s1Helper;
    S1SolutionHelper s1SolutionHelper;
    address registry = address(0x1234); // Mock registry address
    address user = address(0x5678); // Mock user address
    address helperContractAddress = 0x6E6Fe04023Fa82465418FE1b821134C039e44D2b;

    function setUp() public {
        s1Helper = new S1Helper();
        s1 = new S1(registry, address(s1Helper));
        s1SolutionHelper = new S1SolutionHelper();
        vm.prank(user);
    }

    function testSolveChallenge() public {
        // Get encoded values
        bytes4 selector = s1SolutionHelper.returnSelectorOne();
        bytes memory inputData = s1SolutionHelper.returnInputData(address(s1Helper));

        // Mock registry behavior
        vm.mockCall(registry, abi.encodeWithSelector(ICTFRegistry.mintNft.selector, user, ""), abi.encode(1));

        // Expect the call to mintNft
        vm.expectCall(registry, abi.encodeWithSelector(ICTFRegistry.mintNft.selector, user, ""));

        // Call solveChallenge
        vm.prank(user);
        s1.solveChallenge(selector, inputData, "");
    }
}
