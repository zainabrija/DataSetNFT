const HDWalletProvider = require("@truffle/hdwallet-provider");
const { mnemonic, alchemyApiKey } = require("./secrets.json");

module.exports = {
  networks: {
    sepolia: {
      provider: () =>
        new HDWalletProvider(
          mnemonic, // MetaMask seed phrase
          alchemyApiKey // Alchemy HTTP URL for Sepolia network
        ),
      network_id: 11155111, // Sepolia's network id
      gas: 8000000,
      gasPrice: 10000000000, // 10 Gwei
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true,
    },
  },
  compilers: {
    solc: {
      version: "0.8.20", // Solidity version
    },
  },
};
