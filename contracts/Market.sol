pragma solidity ^0.5.0;

contract Market {
    bytes32 public store_name;
    uint256 public store_balance;

    mapping (address => Customer) customers;
    mapping (uint256 => Product) products;

    event PurchaseCompleted(address customer, uint256 payment);
    event PurchaseFailed(address customer, uint256 customerBalance, uint256 payment);

    struct Customer {
        address adr;
        bytes32 name;
        uint256 balance;
    }

    struct Product {
        uint256 id;
        bytes32 name;
        bytes32 description;
        uint256 price;
    }

    
}