# Cyfrin Updraft Security Course CTF Solutions

This repository documents my solutions to the Capture The Flag (CTF) challenges in the [Cyfrin Updraft Security Course](https://updraft.cyfrin.io/). The course focuses on Ethereum smart contract security, and each challenge tests various aspects of Solidity, contract interactions, and blockchain concepts.

## Purpose

The goal of this repository is to:

- Record my progress through the course's CTF challenges.
- Provide detailed explanations of each challenge and its solution.
- Serve as a reference for learning smart contract security and Foundry-based development.

## Repository Structure

Each challenge level is organized as a separate Foundry project within its own directory (e.g., `level1/`, `level2/`, etc.). The structure for each level typically includes:

- **Contracts**: Source code for the challenge contracts and helper utilities.
- **Tests**: Foundry test files to verify the solution.
- **Scripts**: Foundry scripts to generate necessary data (e.g., encoded values) for solving challenges.
- **README**: A detailed Markdown file explaining the challenge, solution, setup instructions, and key learnings.

Example:

```bash
cyfrin-updraft-security-course-ctf-solutions/
├── level1/
│   ├── README.md
│   ├── foundry.toml
│   ├── src/
│   ├── test/
│   └── script/
├── level2/
│   ...
└── README.md
```

## Setup

To explore or run the solutions, you'll need [Foundry](https://book.getfoundry.sh/getting-started/installation) installed. Clone the repository and follow the level-specific READMEs for detailed instructions.

```bash
git clone https://github.com/<your-username>/cyfrin-updraft-security-course-ctf-solutions.git
cd cyfrin-updraft-security-course-ctf-solutions
```

Install dependencies for each level:

```bash
forge install
```

## Usage

Each level's README provides:

- A description of the challenge.
- Step-by-step solution details.
- Instructions to compile, test, and run scripts.
- Encoded values or transactions for interacting with contracts on testnets (e.g., Sepolia).

To run tests or scripts for a specific level, navigate to its directory and use Foundry commands like:

```bash
forge test
forge script script/<ScriptName>.s.sol
```

## Contributions

This repository is a personal project to document my learning journey. Feel free to use it as a reference, but please respect the Cyfrin Updraft course's guidelines on sharing solutions.

### Instructions

1. **Create the README File**:
   - In the root of your repository (`cyfrin-updraft-security-course-ctf-solutions/`), create a file named `README.md`.
   - Copy and paste the above content into `README.md`.

2. **Update Placeholder**:
   - Replace `<your-username>` in the `git clone` URL with your actual GitHub username.

3. **Commit and Push**:
   - Add the README to your repository:

     ```bash
     git add README.md LICENSE
     git commit -m "Add general README for repository"
     git push origin main
     ```

4. **Verify on GitHub**:
   - Visit `https://github.com/<your-username>/cyfrin-updraft-security-course-ctf-solutions` to ensure the README displays correctly as the repository's homepage.
