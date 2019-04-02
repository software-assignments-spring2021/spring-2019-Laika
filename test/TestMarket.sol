pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "contracts/Market.sol";
import "truffle/DeployedAddresses.sol";


contract TestMarket {

    // Market market = Market(DeployedAddresses.Market());

    // function beforeAll() public {
    //     market = new Market();
    //     market.registerProduct(5, "test product", "test description", 22);
    //     market.registerCustomer(address(this), "Masaki", 1000);
    // }

    // function testGetBalance() public {
    //     uint256 expectedBalance = 1000;
    //     uint256 actualBalance = market.getBalance();
    //     Assert.equal(expectedBalance, actualBalance, "Customer should get balance 2000");
    // }

    // function testRegisterProduct() public {
    //     bool expected = true;
    //     bool result = market.registerProduct(20, "dogfood", "it is very tasty dogfood", 99);
    //     Assert.equal(result, expected, "Market should register a product");
    // }

    // function testGetProductInfoName() public {
    //     bytes32 expected_product_name = bytes32("test product");
    //     (bytes32 _name, bytes32 _description, uint256 _price) = market.getProductInfo(5);
    //     Assert.equal(_name, expected_product_name, "Market should return product name");
    // }

    // function testGetProductInfoDescription() public {
    //     bytes32 expected_product_description = bytes32("test description");
    //     (bytes32 _name, bytes32 _description, uint256 _price) = market.getProductInfo(5);
    //     Assert.equal(_name, expected_product_description, "Market should return product description");
    // }

    // function testGetProductInfoPrice() public {
    //     uint256 expected_product_price = 22;
    //     (bytes32 _name, bytes32 _description, uint256 _price) = market.getProductInfo(5);
    //     Assert.equal(_name, expected_product_price, "Market should return product price");
    // }

    // function testPurchaseProduct() public {
    //     bool expected = market.buyProduct(5);
    //     Assert.isTrue(expected, "Customer should be able to purchase dogfood(id=5) product");        
    // }
}