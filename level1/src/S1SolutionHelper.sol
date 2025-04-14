// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract S1SolutionHelper {
    function returnSelectorOne() public pure returns (bytes4) {
        bytes4 selector = bytes4(keccak256("returnTrue()"));
        return selector;
    }

    function returnInputData(address contractAddress) public pure returns (bytes memory) {
        bytes4 selector = bytes4(keccak256("returnTrueWithGoodValues(uint256,address)"));
        bytes memory data = abi.encodeWithSelector(selector, 9, contractAddress);
        return data;
    }
}
