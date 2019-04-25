pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "contracts/HomeSingleton.sol";
import "contracts/ExposedSingleton.sol";

contract TestHomeSingleton {
  address expectedOwner = address(this);
  ExposedSingleton thisHome = new ExposedSingleton();

  function testIsInstantiated() public {
    bool expectedStatus = false;
    bool returnedStatus = thisHome.isInstantiated();
    Assert.equal(expectedStatus, returnedStatus, "Instance should not exist!");
  }

  function testIsInstantiated2() public {
    bool expectedStatus = true;
    HomeSingleton testHome = thisHome.getInstance();
    bool returnedStatus = thisHome.isInstantiated();
    Assert.equal(expectedStatus, returnedStatus, "Instance should exist!");
  }
}
