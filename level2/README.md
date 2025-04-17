# Cyfrin Updraft Security Course - Level 2: What is a Smart Contract Security Review?

   This directory documents the solution for Level 2 of the Cyfrin Updraft security course, titled "Section 2: What is a smart contract security review?" The challenge involves calling a function with the correct boolean value to mint an NFT.

## Challenge Overview

   The objective is to call the `solveChallenge` function on the `S2` contract, deployed on Sepolia at [0x34d130B174F4a30A846FED7C02FCF53A19a4c2B6](https://sepolia.etherscan.io/0x34d130B174F4a30A846FED7C02FCF53A19a4c2B6#writeContract). The function requires:

- A `bool weCallItSecurityReview`: Must be `true` to indicate preference for the term "security review" over "security audit".
- A `string yourTwitterHandle`: Your Twitter handle (optional, can be empty).

The `S2` contract:

- Checks if `weCallItSecurityReview` is `true`. If not, it reverts with `S2__WrongValue`.
- Calls `_updateAndRewardSolver` to mint an NFT via the `ICTFRegistry` if the check passes.

## Solution

To solve the challenge, call `solveChallenge` with:

- `weCallItSecurityReview`: `true`
- `yourTwitterHandle`: `""` (empty string)

### Step-by-Step Solution

   1. **Understand the Requirement**:
      - The function checks if `weCallItSecurityReview` is `true`, reflecting the course's emphasis on terminology ("security review" vs. "security audit").
      - No additional computation or encoding is needed, unlike Level 1.

   2. **Call `solveChallenge`**:
      - Use the Sepolia explorer's "Write Contract" tab (once the contract address is known).
      - Input:
        - `weCallItSecurityReview`: `true`
        - `yourTwitterHandle`: `""`
      - Submit the transaction to mint the NFT.

## Project Structure

   ```bash
   level2/
   ├── README.md
   ├── foundry.toml
   ├── script
   ├── src/
   │   ├── Challenge.sol
   │   ├── IChallenge.sol
   │   ├── ICTFRegistry.sol
   │   └── S2.sol
   └── test/
       └── S2Test.t.sol
   ```

- **Contracts**: Include the challenge contract (`S2`) and its dependencies.
- **Test**: `S2Test.t.sol` verifies the solution by testing both valid and invalid inputs.

## Setup and Usage

   1. **Install Foundry**:

      ```bash
      curl -L https://foundry.paradigm.xyz | bash
      foundryup
      ```

   2. **Navigate to Level 2**:

      ```bash
      cd level2
      ```

   3. **Install Dependencies**:

      ```bash
      forge install
      ```

   4. **Run Tests**:

      ```bash
      forge test --match-path test/S2Test.t.sol -vv
      ```
