// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {S2} from "../src/S2.sol";
import {Challenge} from "../src/Challenge.sol";
import {ICTFRegistry} from "../src/ICTFRegistry.sol";

contract S2Test is Test {
    S2 s2;
    address registry = address(0x1234); // Mock registry address
    address user = address(0x5678); // Mock user address

    function setUp() public {
        s2 = new S2(registry);
    }

    function testSolveChallenge() public {
        // Mock registry behavior
        vm.mockCall(registry, abi.encodeWithSelector(ICTFRegistry.mintNft.selector, user, ""), abi.encode(1));

        // Expect the call to mintNft
        vm.expectCall(registry, abi.encodeWithSelector(ICTFRegistry.mintNft.selector, user, ""));

        // Call solveChallenge with weCallItSecurityReview = true
        vm.prank(user);

        // @param weCallItSecurityReview: boolean
        // @param yourTwitterHandle: string (optional)
        // the boolean value here is `true` because the correct answer is "security review" and not "security audit"

        // weCallItSecurityReview = true
        s2.solveChallenge(true, "");
    }

    function testSolveChallengeFailsWithFalse() public {
        // Expect revert when weCallItSecurityReview = false
        vm.expectRevert(S2.S2__WrongValue.selector);
        vm.prank(user);
        s2.solveChallenge(false, "");
    }
}
