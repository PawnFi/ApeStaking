# ApeStaking

Solidity contracts used in [Pawnfi](https://www.pawnfi.com/) .

## Overview

The ApeStaking contract streamlines the staking process for Pawnfi users, enabling them to effortlessly stake their Ape coins and benefit from compounded rewards through automatic reinvestment. Catering to both experienced NFT enthusiasts engaged with Pawnfi's consignment, leverage, and lending modules, as well as newcomers seeking to maximize their Ape staking returns, the contract offers a seamless experience for all users. By interacting directly with the Horizen Labs Contract, the ApeStaking contract ensures the most legitimate Ape coin rewards, providing users with a secure and efficient solution to optimize their staking investments.

## Audits

- PeckShield ( - ) : [report](./audits/audits.pdf) (Also available in Chinese in the same folder)

## Contracts

### Installation

- To run apestaking, pull the repository from GitHub and install its dependencies. You will need [npm](https://docs.npmjs.com/cli/install) installed.

```bash
git clone https://github.com/PawnFi/ApeStaking.git
cd ApeStaking
npm install 
```
- Create an enviroment file named `.env` and fill the next enviroment variables

```
# Import private key
PRIVATEKEY= your private key  

# Add Infura provider keys
MAINNET_NETWORK=https://mainnet.infura.io/v3/YOUR_API_KEY
GOERLI_NETWORK=https://goerli.infura.io/v3/YOUR_API_KEY

```

### Compile

```
npx hardhat compile
```



### Local deployment

In order to deploy this code to a local testnet, you should install the npm package `@pawnfi/ape-staking` and import the ApeStaking bytecode located at
`@pawnfi/ape-staking/artifacts/contracts/ApeStaking.sol/ApeStaking.json`.
For example:

```typescript
import {
  abi as APE_STAKING_ABI,
  bytecode as APE_STAKING_BYTECODE,
} from '@pawnfi/ape-staking/artifacts/contracts/ApeStaking.sol/ApeStaking.json'

// deploy the bytecode
```

This will ensure that you are testing against the same bytecode that is deployed to mainnet and public testnets, and all Pawnfi code will correctly interoperate with your local deployment.

### Using solidity interfaces

The Pawnfi ApeStaking interfaces are available for import into solidity smart contracts via the npm artifact `@pawnfi/ape-staking`, e.g.:

```solidity
import '@pawnfi/ape-staking/contracts/interfaces/IApeStaking.sol';

contract MyContract {
  IApeStaking apeStaking;

  function doSomethingWithApeStaking() {
    // apeStaking.getUserInfo(...);
  }
}

```

## License

- (c) Pawnfi Ltd., 2023 - [All rights reserved](https://github.com/PawnFi/ApeStaking/blob/master/LICENSE).


## Discussion

For any concerns with the protocol, open an issue or visit us on [Discord](https://discord.com/invite/pawnfi) to discuss.

For security concerns, please email [dev@pawnfi.com](mailto:dev@pawnfi.com).

_© Copyright 2023, Pawnfi Ltd._