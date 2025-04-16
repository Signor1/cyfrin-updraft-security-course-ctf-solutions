// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {IChallenge} from "./IChallenge.sol";
import {ICTFRegistry} from "./ICTFRegistry.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

abstract contract Challenge is IChallenge, Ownable {
    error Challenge__CantBeZeroAddress();

    string private constant BLANK_TWITTER_HANLE = "";
    string private constant BLANK_SPECIAL_DESCRIPTION = "";
    ICTFRegistry internal immutable i_registry;

    constructor(address registry) Ownable(msg.sender) {
        if (registry == address(0)) {
            revert Challenge__CantBeZeroAddress();
        }
        i_registry = ICTFRegistry(registry);
    }

    function _updateAndRewardSolver(
        string memory twitterHandleOfSolver
    ) internal {
        ICTFRegistry(i_registry).mintNft(msg.sender, twitterHandleOfSolver);
    }

    function extraDescription(
        address /* user */
    ) external view virtual returns (string memory) {
        return BLANK_SPECIAL_DESCRIPTION;
    }
}
