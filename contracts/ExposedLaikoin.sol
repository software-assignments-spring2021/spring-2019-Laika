pragma solidity ^0.5.0;
import "contracts/Laikoin.sol";
import "node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @notice
 Laikoin with all functions set as 'public' for unit testing purposes
*/


contract ExposedLaikoin is Laikoin {
    using SafeMath for uint256;
    using ExtendedMath for uint;
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

    }

    function getAddress() public view returns (address) {
        return msg.sender;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }

    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        transfer(to, value);
        emit Approval(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }
    
    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].add(addedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].sub(subtractedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

    function mint(address account, uint256 value) public {
        require(account != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
    }

    function burn(address account, uint256 value) public {
        require(account != address(0));

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
    }

    function burnFrom(address account, uint256 value) public {
        _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(value);
        _burn(account, value);
        emit Approval(account, msg.sender, _allowed[account][msg.sender]);
    }
}