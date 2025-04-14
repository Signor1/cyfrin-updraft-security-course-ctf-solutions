// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface IChallenge {
    function description() external view returns (string memory);
    function extraDescription(address user) external view returns (string memory);
    function specialImage() external view returns (string memory);
    function attribute() external view returns (string memory);
}
