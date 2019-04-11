pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Charity.sol";

contract TestCharity {
    function testGetShortIntro() public {
        Charity cha = new Charity();
        string expected = "Brooklyn Animal Action is an all-volunteer organization dedicated to improving the lives of Brooklyn's animals. Working with our communities we find homes for adoptable animals, facilitate Trap-Neuter-Release programs, perform community outreach and education. Since our founding in 2010, Brooklyn Animal Action has found homes for over 4,000 cats (and a few dogs) and TNR'd hundreds more. We believe in working together to create a better life for New York's animals.";
        string result = cha.getShirtIntro();
        Assert.equal(expected, result, "should return short intro about Brooklyn Animal Action");
    }

    function testGetAbout() public {
        Charity cha = new Charity();
        string expected = "Brooklyn Animal Action strives to make a difference for New York’s animals. We are a Brooklyn-based group of volunteers committed to improving the lives of animals in distress. Working with our communities, we facilitate Trap-Neuter-Return programs, find homes for adoptable animals, perform community outreach and education, and engage in advocacy. Since our founding in 2010, BAA has rehomed over 4000 animals. In addition, we are actively involved in Trap-Neuter-Return programs, which spay/neuter feral cats and return them to the streets in managed colonies. TNR has been found to be the most effective and humane way to control cat overpopulation. We are also dedicated to working directly with our community. We believe the best way to help animals is by educating our neighbors and providing tools to help people help animals themselves. We provide information, resources, and support services to would-be rescuers and concerned citizens. We believe anyone can be a rescuer, with a little support. Rescuers can’t do it alone—we need the community’s help. BAA believes the best way to help animals is to help people do it themselves! We provide information, resources, and moral support so you can be a rescuer, too. Sometimes the difference between wishing you could do something for those kittens down the block, and actually getting them off the street, is just knowing what you need to do. We can talk you through it—how to foster a cat, where to find low-cost spaying and neutering, how to advertise and find great homes. We can also provide the tools to help you do your own TNR projects. If we all pitch in, everyone benefits!";
        string result = cha.getAbout();
        Assert.equal(expected, result, "should return about of Brooklyn Animal Action");
    }
}