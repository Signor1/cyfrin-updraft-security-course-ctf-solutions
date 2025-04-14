# Cyfrin Updraft Security Course - Level 1: Refresher

   This repository documents the solution for Level 1 of the Cyfrin Updraft security course, titled "Section 1: Refresher." The challenge involves interacting with a Solidity smart contract to mint an NFT by correctly calling a helper contract with specific function selectors and encoded data.

## Challenge Overview

   The objective is to call the `solveChallenge` function on the `S1` contract, deployed on Sepolia at [0x76d2403b80591d5f6af2b468bc14205fa5452ac0](https://sepolia.etherscan.io/address/0x76d2403b80591d5f6af2b468bc14205fa5452ac0#writeContract). The function requires:

- A `bytes4` selector for the first call to the helper contract.
- A `bytes` input data for the second call to the helper contract.
- A `string` for your Twitter handle (optional).

   The `S1` contract interacts with the `S1Helper` contract at [0x6E6Fe04023Fa82465418FE1b821134C039e44D2b](https://sepolia.etherscan.io/address/0x6E6Fe04023Fa82465418FE1b821134C039e44D2b), which has two functions:
- `returnTrue()`: Returns `true`.
- `returnTrueWithGoodValues(uint256 nine, address contractAddress)`: Returns `true` if `nine == 9` and `contractAddress` is the helper contract's address.

   The `solveChallenge` function makes two calls to the helper contract:
   1. Using the provided `selectorOne`, expecting a return value of `true` (encoded as `1`).
   2. Using the provided `inputData`, expecting a return value of `true` (encoded as `1`).

   If both calls succeed, the contract calls `_updateAndRewardSolver`, which mints an NFT via the `ICTFRegistry`.

## Solution

   To solve the challenge, we need to:

- Compute the function selector for `returnTrue()`.
- Encode a call to `returnTrueWithGoodValues(9, helperContractAddress)`.

### Step-by-Step Solution

   1. **Compute the Selector for `returnTrue()`**:
      - Function signature: `returnTrue()`
      - Keccak256 hash: `keccak256("returnTrue()")`
      - Selector: First 4 bytes of the hash, `0xf00df8d9`

   2. **Encode the Call to `returnTrueWithGoodValues`**:
      - Function signature: `returnTrueWithGoodValues(uint256,address)`
      - Selector: `keccak256("returnTrueWithGoodValues(uint256,address)")` gives `0xdcd7ecbc`
      - Parameters:
        - `nine`: `9` (uint256)
        - `contractAddress`: `0x6E6Fe04023Fa82465418FE1b821134C039e44D2b`
      - Encoded data: `abi.encodeWithSelector(0xdcd7ecbc, 9, 0x6E6Fe04023Fa82465418FE1b821134C039e44D2b)`
      - Result: `0xdcd7ecbc00000000000000000000000000000000000000000000000000000000000000090000000000000000000000006e6fe04023fa82465418fe1b821134c039e44d2b`

   3. **Call `solveChallenge`**:
      - Use the Sepolia explorer's "Write Contract" tab.
      - Input:
        - `selectorOne`: `0xf00df8d9`
        - `inputData`: `0xdcd7ecbc00000000000000000000000000000000000000000000000000000000000000090000000000000000000000006e6fe04023fa82465418fe1b821134c039e44d2b`
        - `yourTwitterHandle`: `""` (empty string)
      - Submit the transaction to mint the NFT.

### Implementation

   The solution is implemented in the `S1SolutionHelper` contract, which provides:

- `returnSelectorOne()`: Returns the selector `0xf00df8d9`.
- `returnInputData(address)`: Returns the encoded data for the helper contract address.

## Project Structure

   ```bash
   level1/
   ├── README.md
   ├── foundry.toml
   ├── script/
   │   └── SolveS1.s.sol
   ├── src/
   │   ├── Challenge.sol
   │   ├── ICTFRegistry.sol
   │   ├── IChallenge.sol
   │   ├── S1.sol
   │   ├── S1Helper.sol
   │   └── S1HelperEncode.sol
   └── test/
       └── S1Test.t.sol
   ```

- **Contracts**: Contain the challenge contracts and the solution helper.
- **Test**: `S1Test.t.sol` verifies the solution by simulating the `solveChallenge` call.
- **Script**: `SolveS1.s.sol` outputs the encoded values for CLI access.

## Setup and Usage

   1. **Install Foundry**:

      ```bash
      curl -L https://foundry.paradigm.xyz | bash
      foundryup
      ```

   2. **Clone the Repository**:

      ```bash
      git clone <your-repo-url>
      cd level1
      ```

   3. **Install Dependencies**:

      ```bash
      forge install
      ```

   4. **Run Tests**:

      ```bash
      forge test --match-path test/S1Test.t.sol -vv
      ```

   5. **Get Encoded Values**:
      Run the script to output the selector and input data:

      ```bash
      forge script script/SolveS1.s.sol -vv
      ```

      Example output:

      ```bash
      Selector (bytes4):
      0xf00df8d9
      Input Data (bytes):
      0xdcd7ecbc00000000000000000000000000000000000000000000000000000000000000090000000000000000000000006e6fe04023fa82465418fe1b821134c039e44d2b
      ```

   6. **Solve on Sepolia**:
      - Visit [the contract on Sepolia Etherscan](https://sepolia.etherscan.io/address/0x76d2403b80591d5f6af2b468bc14205fa5452ac0#writeContract).
      - Connect your wallet (e.g., MetaMask).
      - Call `solveChallenge` with the values from the script.
      - Submit the transaction to mint the NFT.

## Key Learnings

- **Function Selectors**: Understanding how to compute selectors using `keccak256` for function signatures.
- **ABI Encoding**: Using `abi.encodeWithSelector` to encode function calls with parameters.
- **Low-Level Calls**: The `S1` contract uses `.call` to interact with the helper contract, requiring precise input formatting.
- **Contract Interaction**: Interacting with deployed contracts via explorers like Etherscan.
