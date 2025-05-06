const hre = require("hardhat");

async function main() {
  const Crowdfunding = await hre.ethers.getContractFactory("Crowdfunding");
  
  // Set goal to 5 ether and duration to 30 days
  const goal = hre.ethers.parseEther("5");
  const durationInDays = 30;

  const crowdfunding = await Crowdfunding.deploy(goal, durationInDays);

  console.log("Crowdfunding contract deployed to:", crowdfunding.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
