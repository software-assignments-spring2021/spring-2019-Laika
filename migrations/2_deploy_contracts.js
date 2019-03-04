var Adoption = artifacts.require("Adoption");
var SafeMath    = artifacts.require("node_modules/openzeppelin-solidity/contracts/lifecycle/SafeMath.sol");
// var Pausable    = artifacts.require("node_modules/openzeppelin-solidity/contracts/math/Pausable.sol");
var Laikoin = artifacts.require("Laikoin")

module.exports = function(deployer) {
    deployer.deploy(Adoption);
    deployer.deploy(SafeMath);
    // deployer.deploy(Pausable);
    deployer.deploy(Laikoin);
};
