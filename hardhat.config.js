require('@nomiclabs/hardhat-ethers');
require("dotenv").config();

const PRIVATE_KEY = process.env.PRIVATE_KEY;
const ANOTHER_PRIVATE_KEY = process.env.ANOTHER_PRIVATE_KEY;
const FTM_KEY = process.env.FTM_KEY;
if (!process.env.PRIVATE_KEY) {
  throw new Error("ENV Variable PRIVATE_KEY not set!");
}
if (!process.env.ANOTHER_PRIVATE_KEY) {
  throw new Error("ENV Variable ANOTHER_PRIVATE_KEY not set!");
}
if (!process.env.FTM_KEY) {
  throw new Error("ENV Variable FTM_KEY not set!");
}

module.exports = {
  solidity: {
    version: '0.8.10',
    settings: {
      optimizer: {
        enabled: true,
        runs: 800,
      }
    }
  },
  networks: {
    hardhat: {
      forking: {
        url: "https://rpc.ftm.tools",
      },
      chainId: 250
    },
    localhost: {
      url: "http://localhost:8545",
      timeout: 2000000000,
      accounts: [PRIVATE_KEY, ANOTHER_PRIVATE_KEY]
    },
    fantom: {
      chainId: 250,
      url: 'https://rpc.ftm.tools',
      accounts: [PRIVATE_KEY, ANOTHER_PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: FTM_KEY
  }
}