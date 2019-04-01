pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "contracts/Market.sol";

contract TestMarket {
  Market market = Market(DeployedAddresses.Market());
  address thisCustomer = address(this);

  function testGetBalance() public {
    uint256 expected = 0;
    Assert.equal(market.getBalance(), expected, "Market should have 0 balance");
  }

  function testRegisterProduct() public {
    bool expected = true;
    bool result = market.registerProduct(10, "Dog Food", "Pupper Food", 25);
    Assert.equal(result, expected, "Store should register dog food");
  }

  function testRegisterCustomer() public {
    bool expected = true;
    bool result = market.registerCustomer(thisCustomer, "Doggo Charity", 0);
    Assert.equal(result, expected, "Customer should have been registered");
  }

  function testGetProductInfo() public {
    bytes32 expectedName = "Dog Food";
    bytes32 expectedDesc = "Pupper Food";
    uint256 expectedPrice = 25;
    bytes32 returnName;
    bytes32 returnDesc;
    uint256 returnPrice;
    (returnName, returnDesc, returnPrice) = market.getProductInfo(10);
    Assert.equal(returnName, expectedName, "Name should match");
    Assert.equal(returnDesc, expectedDesc, "Desc should match");
    Assert.equal(returnPrice, expectedPrice, "Price should match");
  }
}
