pragma solidity ^0.5.0;

import "node_modules/openzeppelin-solidity/contracts/lifecycle/Pausable.sol";
import "node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @title Laikoin - ERC20 token born for tracking usage after donation.

 * @notice

*/

/** @dev Safe '>' implemented */
library ExtendedMath {
    //return the smaller of the two inputs (a or b)
    function limitLessThan(uint a, uint b) internal pure returns (uint c) {
        if(a > b) return b;
        return a;
    }
}

/** @dev BenevoToken contract extends the ERC20 Interface */
contract ERC20Interface {
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

/** @dev Used for token transfer as contracts generally do not receive events */
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}

contract Laikoin is ERC20, Pausable {
    //all arithmetic operation in this contract uses Openzeppelin's SafeMath library
    using SafeMath for uint;
    using ExtendedMath for uint;
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;

    /** @dev Deafault Constructor */
    constructor() public {
        symbol = "LAI";
        name = "Laikoin";
        decimals = 1;
        //population of the world on March 2019 (7.5 billion) divided by 1000
        _totalSupply = 750000 * 10**uint(decimals);
        
    }

    function transfer(address to, uint256 value) public whenNotPaused returns (bool) {
        return super.transfer(to, value);
    }

    function transferFrom(address from, address to, uint256 value) public whenNotPaused returns (bool) {
        return super.transferFrom(from, to, value);
    }

    function approve(address spender, uint256 value) public whenNotPaused returns (bool) {
        return super.approve(spender, value);
    }

    function increaseAllowance(address spender, uint addedValue) public whenNotPaused returns (bool success) {
        return super.increaseAllowance(spender, addedValue);
    }

    function decreaseAllowance(address spender, uint subtractedValue) public whenNotPaused returns (bool success) {
        return super.decreaseAllowance(spender, subtractedValue);
    }
}
