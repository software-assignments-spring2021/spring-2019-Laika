pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Charity.sol";

contract TestCharity {
    function testGetShortIntro() public {
        Charity cha = new Charity();
        string expected = "Brooklyn Animal Action is an all-volunteer organization dedicated to improving the lives of Brooklyn's animals. Working with our communities we find homes for adoptable animals, facilitate Trap-Neuter-Release programs, perform community outreach and education. Since our founding in 2010, Brooklyn Animal Action has found homes for over 4,000 cats (and a few dogs) and TNR'd hundreds more. We believe in working together to create a better life for New York's animals.";
        string result = cha.getShirtIntro();
        Assert.equal(expected, result, "should return short intro about Brooklyn Animal Action")
    }
}