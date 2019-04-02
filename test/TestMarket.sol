pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "contracts/Market.sol";
import "truffle/DeployedAddresses.sol";


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

    function testGetProductInfoName() public {
        bytes32 expected_product_name = bytes32("test product");
        (bytes32 _name, bytes32 _description, uint256 _price) = market.getProductInfo(5);
        Assert.equal(_name, expected_product_name, "Market should return product name");
    }

    function testGetProductInfoDescription() public {
        bytes32 expected_product_description = bytes32("test description");
        (bytes32 _name, bytes32 _description, uint256 _price) = market.getProductInfo(5);
        Assert.equal(_name, expected_product_description, "Market should return product description");
    }

    function testGetProductInfoPrice() public {
        uint256 expected_product_price = 22;
        (bytes32 _name, bytes32 _description, uint256 _price) = market.getProductInfo(5);
        Assert.equal(_name, expected_product_price, "Market should return product price");
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

    function testPurchaseProduct() public {
        bool expected = market.buyProduct(5);
        Assert.isTrue(expected, "Customer should be able to purchase dogfood(id=5) product");        
    }
}