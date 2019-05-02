pragma solidity ^0.5.0;
import "./Laikoin.sol";

/**
 * @notice
 Laikoin with all functions set as 'public' for unit testing purposes
*/


contract ExposedLaikoin is Laikoin {
    string public symbol;
    string public  name;
    uint8 public decimals;
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;
    uint256 private _totalSupply;

    /** @dev Deafault Constructor */
    constructor() public {
        symbol = "LAI";
        name = "Laikoin";
        decimals = 1;
        //population of the world on March 2019 (7.5 billion) divided by 1000
        _totalSupply = 750000 * 10**uint(decimals);
        _balances[msg.sender] = 1000;
    }

    function getAddress() public view returns (address) {
        return msg.sender;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function mint(address account, uint256 value) public {
        require(account != address(0));

        _totalSupply = _totalSupply + value;
        _balances[account] = _balances[account] + value;
        emit Transfer(address(0), account, value);
    }
}
