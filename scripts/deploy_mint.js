
const hre = require("hardhat")


async function main() {
  const yourToken = await hre.ethers.getContractFactory("yourToken");
  const your_token = await yourToken.deploy();
  await your_token.deployed();

  console.log(`Token contract successfully deployed at ${your_token.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});