pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "contracts/HomeSingleton.sol";

contract testHomeSingleton {
  address expectedOwner = address(this);
  HomeSingleton thisHome = new HomeSingleton();

  function testIsInstantiated() public {
    bool expectedStatus = false;
    bool returnedStatus = thisHome.isInstantiated();
    Assert.equal(expectedStatus, returnedStatus, "Instance should not exist!");
  }
}
