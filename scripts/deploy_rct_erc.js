
const hre = require("hardhat")


async function main() {
    const RCToken = await hre.ethers.getContractFactory("RCTokenV2");
    const rcToken = await RCToken.deploy();
    await rcToken.deployed();

    console.log(`Token contract successfully deployed at ${rcToken.address}`);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});