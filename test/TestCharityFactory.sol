pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "contracts/CharityFactory.sol";

contract TestCharityFactory {
	function testCreateChildContract() public {
        CharityFactory cf = new CharityFactory();
        bool expected = true;
		bool result = cf.createChildContract("some short intro about the charity", "some about page");
		Assert.equal(expected, result, "Returned address should be equal to expected");
	}
}
