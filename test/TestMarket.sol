pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "contracts/Market.sol";
import "truffle/DeployedAddresses.sol";


contract TestMarket {

    Market market = Market(DeployedAddresses.Market());

    function beforeAll() public {
        market = new Market();
        address dummyAddress = address(0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA);
        address customerAddress = address(0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB);
        market.registerProduct(5, "test product", "test description", 22);
        market.registerCustomer(customerAddress, "Masaki", 1000);
    }

    function testGetBalance() public {
        market = new Market();
        market.registerCustomer(address(this), "Bob", 2000);
        uint256 expectedBalance = 2000;
        uint256 actualBalance = market.getBalance();
        Assert.equal(expectedBalance, actualBalance, "Customer should get balance 2000");
    }

    function testRegisterProduct() public {
        bool expected = true;
        bool result = market.registerProduct(20, "dogfood", "it is very tasty dogfood", 99);
        Assert.equal(result, expected, "Market should register a product");
    }

    function testGetProductInfoName() public {
        bytes32 expected_product_name = bytes32("test product");
        var (_name, _description, _price) = market.getProductInfo(5);
        Assert.equal(_name, expected_product_name, "Market should return product name");
    }

    function testGetProductInfoDescription() public {
        bytes32 expected_product_description = bytes32("test description");
        var (_name, _description, _price) = market.getProductInfo(5);
        Assert.equal(_name, expected_product_description, "Market should return product description");
    }

    function testGetProductInfoPrice() public {
        uint256 expected_product_price = 22;
        var (_name, _description, _price) = market.getProductInfo(5);
        Assert.equal(_name, expected_product_price, "Market should return product price");
    }

    function testPurchaseProduct() public {
        bool expected = market.buyProduct(5);
        Assert.isTrue(expected, "Customer should be able to purchase dogfood(id=5) product");        
    }
}