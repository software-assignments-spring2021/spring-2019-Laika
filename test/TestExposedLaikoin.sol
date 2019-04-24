pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ExposedLaikoin.sol";

contract TestExposedLaikoin {
    function testMint() public {
		ExposedLaikoin user1 = new ExposedLaikoin();
		address user1Addr = user1.getAddress();
		user1.mint(user1Addr, 1000);
		Assert.equal(user1.balanceOf(user1Addr), 2000, "User1 should have 2000 tokens now");
	}
}