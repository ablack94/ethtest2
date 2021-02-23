
const Test = artifacts.require("DydxFlashLoaner");

module.exports = function(deployer) {
    deployer.deploy(Test);
};

/*
const Test = artifacts.require("OneSplitSwapper");

module.exports = function(deployer) {
    deployer.deploy(Test);
};
*/

/*
const Arbitrage = artifacts.require("Arbitrage");

module.exports = function(deployer) {
    deployer.deploy(Arbitrage);
};
*/