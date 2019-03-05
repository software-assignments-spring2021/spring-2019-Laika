pragma solidity ^0.5.0;
import "contracts/Laikoin.sol";
import "node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @notice
 Laikoin with all functions set as 'public' for unit testing purposes
*/


contract ExposedLaikoin is Laikoin {

    function mint(address account, uint256 value) public {
        return _mint(account, value);
    }

    function burn(address account, uint256 value) public {
        return _burn(account, value);
    }

    function burnFrom(address account, uint256 value) public {
        return _burnFrom(account, value);
    }
}