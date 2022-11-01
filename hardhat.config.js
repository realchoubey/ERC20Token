require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "hardhat",
  paths: {
    artifacts: './src/artifacts',
  },
  networks: {
    hardhat: {},
    goerli: {
      url: "https://eth-goerli.nodereal.io/v1/0d62e946ee1d4cb997768dab09e2ef07",
      accounts: ['d5af0fc0f782f47a4117511e5962770374f1a8d61d0978d0d6965ea086d004c2']
    }
  },
  solidity: "0.8.9",
  etherscan: {
    apiKey: {
      goerli: "WTFWHQRNT3PSQ1TCFG9BAQU11U7MKX27YS"
    }
  }
};
