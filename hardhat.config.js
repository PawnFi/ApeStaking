require('dotenv').config()
require("@nomicfoundation/hardhat-toolbox");

module.exports = {
	solidity: {
		compilers: [{
			version: "0.8.17",
			settings: {
				optimizer: {
					enabled: true,
					runs: 200
				}
			}
		}]
	},
	networks: {
		mainnet: {
			url: `${process.env.MAINNET_NETWORK}`,
			chainId: 1,
			gasPrice: 'auto',
			accounts: [`${process.env.PRIVATEKEY}`],
		},
		goerli: {
			url: `${process.env.GOERLI_NETWORK}`,
			chainId: 5,
			gasPrice: 'auto',
			accounts: [`${process.env.PRIVATEKEY}`],
		}
	}
};