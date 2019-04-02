pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "contracts/Market.sol";

contract TestMarket {
  Market market;
  address thisCustomer;

  function beforeAll() public {
    market = new Market();
    thisCustomer = address(this);
    market.registerProduct(5, "test product", "test description", 25);
    market.registerCustomer(thisCustomer, "Customer", 1000);
  }

  function testGetBalance() public {
    uint256 expected = 1000;
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
    bytes32 expectedName = "test product";
    bytes32 expectedDesc = "test description";
    uint256 expectedPrice = 25;
    bytes32 returnName;
    bytes32 returnDesc;
    uint256 returnPrice;
    (returnName, returnDesc, returnPrice) = market.getProductInfo(5);
    Assert.equal(returnName, expectedName, "Name should match");
    Assert.equal(returnDesc, expectedDesc, "Desc should match");
    Assert.equal(returnPrice, expectedPrice, "Price should match");
  }
}
