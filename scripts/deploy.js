
const hre = require("hardhat")


async function main() {
  const Greeter = await hre.ethers.getContractFactory("greeter");
  const greeter = await Greeter.deploy("Hello World");
  await greeter.deployed();

  console.log(`contract successfully deployed to ${greeter.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});