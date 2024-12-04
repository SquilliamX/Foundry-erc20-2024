# OurToken (OT) - ERC-20 Token Implementation

A professional implementation of an ERC-20 token smart contract built with Solidity and OpenZeppelin, featuring comprehensive testing and deployment scripts.

## Overview

OurToken (OT) is a standard-compliant ERC-20 token implementation that demonstrates best practices in smart contract development. Built on OpenZeppelin's battle-tested ERC-20 implementation, this project showcases secure token creation, testing, and deployment processes.

## Features

- ✅ Full ERC-20 compliance
- 🔒 Built on OpenZeppelin's secure implementation
- 🧪 Comprehensive test coverage
- 📄 Clean, documented code
- 🚀 Professional deployment scripts

## Technical Details

- **Token Name:** OurToken
- **Symbol:** OT
- **Initial Supply:** 1000 tokens
- **Decimals:** 18
- **Solidity Version:** 0.8.19
- **Framework:** Foundry

## Smart Contracts

### Core Contract (`OurToken.sol`)

The main token contract inherits from OpenZeppelin's ERC-20 implementation, providing:

- Standard token functionality (transfer, approve, transferFrom)
- Initial supply minting to contract deployer
- Gas-efficient operations

### Deployment (`DeployOurToken.s.sol`)

A robust deployment script that:

- Handles initial token supply configuration
- Supports deployment across any EVM-compatible chain
- Implements proper broadcasting controls

## Testing

The project includes extensive testing (`OurTokenTest.t.sol`) covering:

- Token transfers
- Allowance mechanics
- Balance tracking
- Complex token interactions

Key test scenarios include:

- Basic transfer functionality
- Allowance and delegation testing
- Balance verification after transfers
- Multi-user interaction scenarios

## Getting Started

1. Clone the repository

```bash
git clone <repository-url>
```

2. Install dependencies

```bash
forge install
```

3. Run tests

```bash
forge test
```

4. Deploy

```bash
forge script script/DeployOurToken.s.sol --rpc-url <your_rpc_url> --account <account_name> --sender <address> --broadcast`
```

## Contract Interaction

After deployment, you can interact with the token using standard ERC-20 functions:

Examples:

```solidity
// Transfer tokens
ourToken.transfer(recipient, amount);

// Approve spending
ourToken.approve(spender, amount);

// Transfer tokens on behalf of another address
ourToken.transferFrom(sender, recipient, amount);

// Check balance
ourToken.balanceOf(address);
```

## Testing Coverage

The test suite includes:

- Basic token functionality tests
- Transfer and allowance scenarios
- Multi-user interaction tests
- Edge case handling

Run test coverage with:

```bash
forge coverage
```

## Security Considerations

- Built on OpenZeppelin's audited ERC-20 implementation
- Comprehensive test coverage ensures reliable functionality
- Standard-compliant implementation
- No custom modifications to core ERC-20 functionality
- Follows best practices for token deployment and initialization

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## References

- [ERC-20 Token Standard](https://eips.ethereum.org/EIPS/eip-20)
- [OpenZeppelin Documentation](https://docs.openzeppelin.com/contracts/4.x/erc20)
- [Foundry Documentation](https://book.getfoundry.sh/)

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

_Note: This implementation is provided as-is. Always conduct proper security audits before deploying to production._

Built with ❤️ by Squilliam
