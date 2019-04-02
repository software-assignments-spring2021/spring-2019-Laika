pragma solidity ^0.5.0;

contract Market {
    bytes32 public store_name;
    uint256 public store_balance;

    mapping (address => Customer) customers;
    mapping (uint256 => Product) products;

    event PurchaseCompleted(address customer, uint256 payment);
    event PurchaseFailed(address customer, uint256 customerBalance, uint256 payment);
    event ProductRegistered(uint productId);
    event CustomerRegistered(address customer);
    event CustomerRegistrationFailed(address customer);

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

    // ether payable fallback
    function() external payable {}

    function getBalance() public view returns (uint256 _balance) {
        return customers[msg.sender].balance;
    }

    function getProductInfo(uint256 id) public view returns (bytes32 name, bytes32 description, uint256 price) {
        return (products[id].name, products[id].description, products[id].price);
    }

    function buyProduct(uint256 id) public returns (bool success) {
        Customer memory customer = customers[msg.sender];
        Product memory product = products[id];
        if ((customer.balance >= product.price)) {
            customer.balance -= product.price;
            emit PurchaseCompleted(msg.sender, product.price);
            return true;
        }
        emit PurchaseFailed(msg.sender, customer.balance, product.price);
        return false;
    }

    function registerProduct(uint256 id, bytes32 name, bytes32 description, uint256 price) public returns (bool success) {
        products[id] = Product(id, name, description, price);
        if (price > 0) {
            emit ProductRegistered(id);
            return true;
        }
        return false;
    }

    function registerCustomer(address _address, bytes32 _name, uint256 _balance) public returns (bool success) {
        if (_address != address(0)) {
            customers[_address] = Customer({ adr: _address, name: _name, balance: _balance});
            emit CustomerRegistered(_address);
            return true;
        }
        emit CustomerRegistrationFailed(_address);
        return false;
    }

}