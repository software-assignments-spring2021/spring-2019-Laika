pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "contracts/Laikoin.sol";
import "contracts/ExposedLaikoin.sol";

contract TestLaikoin {

	Laikoin laikoin = Laikoin(DeployedAddresses.Laikoin());
	address expectedOwner = address(this);

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
	function testTransfer() public {
		ExposedLaikoin user1 = new ExposedLaikoin();
		ExposedLaikoin user2 = new ExposedLaikoin();
		address user1Addr = user1.getAddress();
		address user2Addr = user2.getAddress();
		uint user1Bal = user1.balanceOf(user1Addr);
		uint user2Bal = user2.balanceOf(user2Addr);
		bool expected = true;
		bool returned = user1.transfer(user2Addr, 300);
		Assert.equal(expected, returned, "transfer should succeed");
		Assert.equal(user1Bal-300, 700, "user 1 balance should be decremented by 300");
		Assert.equal(user2Bal+300, 1300, "user 2 balance should be incremented by 300");
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
		ExposedLaikoin user1 = new ExposedLaikoin();
		ExposedLaikoin user2 = new ExposedLaikoin();
		address user1Addr = user1.getAddress();
		address user2Addr = user2.getAddress();
		bool expectedPass = true;
		bool returnedPass = user1.transfer(user2Addr, 500);
		Assert.equal(returnedPass, expectedPass, "Transfer passed");
		Assert.equal(user2.balanceOf(user2Addr), 1500, "user should have 1500 tokens");
		//Assert.equal(user2.balanceOf(this), 2500, "User should have 2500 tokens");
		*/

	function testMint() public {
		ExposedLaikoin user1 = new ExposedLaikoin();
		address user1Addr = user1.getAddress();
		user1.mint(user1Addr, 1000);
		Assert.equal(user1.balanceOf(user1Addr), 2000, "User1 should have 2000 tokens now");
	}

	function testBalanceOf() public {
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

	function testAllowance() public {
		Laikoin user1 = new Laikoin();
		Laikoin user2 = new Laikoin();
		address user1Addr = user1.getAddress();
		address user2Addr = user2.getAddress();
		Assert.equal(user1.allowance(user1Addr, user2Addr), 0, "Initially user1 should have no allowance to user 2");
		bool resultSuccessIncrease = user1.increaseAllowance(user2Addr, 300);
		Assert.equal(resultSuccessIncrease, true, "User 1 increasing allowance should succeed");
		Assert.equal(user1.allowance(user1Addr, user2Addr), 300, "User 1 should have 300 allowance to user 2");
		bool resultSuccessDecrease = user1.decreaseAllowance(user2Addr, 100);
		Assert.equal(resultSuccessDecrease, true, "User 1 decreasing allowance should succeed");
		Assert.equal(user1.allowance(user1Addr, user2Addr), 200, "User 1 should have 200 allowance to user 2");
	}
}
