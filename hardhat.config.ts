import "@nomiclabs/hardhat-waffle";
import { HardhatUserConfig } from "hardhat/types";

const forking = process.env.FORKING_URL
  ? {
      url: process.env.FORKING_URL,
      blockNumber: 13485663,
    }
  : undefined;

const config: HardhatUserConfig = {
  networks: {
    hardhat: {
      forking,
      mining: {
        auto: false,
        interval: 5000,
      },
    },
  },
};

export default config;
