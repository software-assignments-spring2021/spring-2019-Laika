var Adoption = artifacts.require("Adoption");
var SafeMath    = artifacts.require("node_modules/openzeppelin-solidity/contracts/lifecycle/Pausable.sol");
var Pausable    = artifacts.require("node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol");
var Laikoin = artifacts.require("Laikoin")

module.exports = function(deployer) {
    deployer.deploy(Adoption);
    deployer.deploy(SafeMath);
    deployer.deploy(Pausable);
    deployer.deploy(Laikoin);
};
