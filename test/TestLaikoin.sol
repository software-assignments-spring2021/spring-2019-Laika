pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "contracts/Laikoin.sol";
import "contracts/ExposedLaikoin.sol";

contract TestLaikoin {

	function testTotalSupply() public {
		Laikoin lai = new Laikoin();
		uint expected = 7500000;
		uint result = lai.totalSupply();
		Assert.equal(result, expected, "Initial total supply should be 7500000");
	}

	function testGetAddress() public {
		address returnedAddress = laikoin.getAddress();
		Assert.equal(returnedAddress, expectedOwner, "Returned address should be equal to expected");
	}
	/*
	function testTransfer() public {
		ExposedLaikoin user1 = new ExposedLaikoin();
		ExposedLaikoin user2 = new ExposedLaikoin();
		address user1Addr = user1.getAddress();
		address user2Addr = user2.getAddress();
		user1.mint(user1Addr, 1000);
		bool success = user1.transfer(user2Addr, 400);
		Assert.equal(success, true, "transfer should succeed");
		Assert.equal(user1.balanceOf(user1Addr), 600, "User1 should have 500 tokens");
		Assert.equal(user2.balanceOf(user2Addr), 400, "User2 should have 500 tokens");
	}
	*/
	/*
	function testAllowance() public {

	}
	*/
	function testBalanceOf() public {
		Laikoin laikoin = Laikoin(DeployedAddresses.Laikoin());
		address expectedOwner = address(this);
		uint256 expectedBalance = 0;
		uint256 returnedBalance = laikoin.balanceOf(expectedOwner);
		Assert.equal(returnedBalance, expectedBalance, "Returned balance should equal expected balance, 0");
	}

	function testApprove() public {
		Laikoin user1 = new Laikoin();
		bool expectedSuccess = true;
		bool resultSuccess = user1.approve(expectedOwner, 0);
		Assert.equal(resultSuccess, expectedSuccess, "User 1 approving user 2 sending 0 tokens should return true");
	}
}
