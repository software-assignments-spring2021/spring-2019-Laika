var Laikoin = artifacts.require("Laikoin");
var ExposedLaikoin = artifacts.require("ExposedLaikoin");
var Market = artifacts.require("Market");
var BrooklynAnimalAction = artifacts.require("BrooklynAnimalAction");

module.exports = function(deployer) {
    deployer.deploy(Laikoin);
    deployer.deploy(ExposedLaikoin);
    deployer.deploy(Market);
    deployer.deploy(BrooklynAnimalAction);
};
