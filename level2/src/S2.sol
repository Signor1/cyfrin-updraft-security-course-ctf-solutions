// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Challenge} from "./Challenge.sol";

contract S2 is Challenge {
    error S2__WrongValue();

    constructor(address registry) Challenge(registry) {}

    function solveChallenge(
        bool weCallItSecurityReview,
        string memory yourTwitterHandle
    ) external {
        if (!weCallItSecurityReview) {
            revert S2__WrongValue();
        }
        _updateAndRewardSolver(yourTwitterHandle);
    }

    function attribute() external pure override returns (string memory) {
        return "Good at function calling";
    }

    function description() external pure override returns (string memory) {
        return "Section 2: What is a smart contract security review?";
    }

    function specialImage() external pure returns (string memory) {
        return "ipfs://QmQG94rge28BJaQAvLV5MkMNNbq8T3r4n9n5Qqxmridanm";
    }
}
