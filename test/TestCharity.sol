pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Charity.sol";

contract TestCharity {
    function testGetShortIntro() public {
        Charity cha = new Charity();
        string memory expected = "Brooklyn Animal Action is an all-volunteer organization dedicated to improving the lives of Brooklyn's animals. Working with our communities we find homes for adoptable animals, facilitate Trap-Neuter-Release programs, perform community outreach and education. Since our founding in 2010, Brooklyn Animal Action has found homes for over 4,000 cats (and a few dogs) and TNR'd hundreds more. We believe in working together to create a better life for New York's animals.";
        string memory result = cha.getShirtIntro();
        Assert.equal(expected, result, "should return short intro about Brooklyn Animal Action");
    }

    function testGetAbout() public {
        Charity cha = new Charity();
        string memory expected = "Brooklyn Animal Action strives to make a difference for New York’s animals. We are a Brooklyn-based group of volunteers committed to improving the lives of animals in distress. Working with our communities, we facilitate Trap-Neuter-Return programs, find homes for adoptable animals, perform community outreach and education, and engage in advocacy. Since our founding in 2010, BAA has rehomed over 4000 animals. In addition, we are actively involved in Trap-Neuter-Return programs, which spay/neuter feral cats and return them to the streets in managed colonies. TNR has been found to be the most effective and humane way to control cat overpopulation. We are also dedicated to working directly with our community. We believe the best way to help animals is by educating our neighbors and providing tools to help people help animals themselves. We provide information, resources, and support services to would-be rescuers and concerned citizens. We believe anyone can be a rescuer, with a little support. Rescuers can’t do it alone—we need the community’s help. BAA believes the best way to help animals is to help people do it themselves! We provide information, resources, and moral support so you can be a rescuer, too. Sometimes the difference between wishing you could do something for those kittens down the block, and actually getting them off the street, is just knowing what you need to do. We can talk you through it—how to foster a cat, where to find low-cost spaying and neutering, how to advertise and find great homes. We can also provide the tools to help you do your own TNR projects. If we all pitch in, everyone benefits!";
        string memory result = cha.getAbout();
        Assert.equal(expected, result, "should return about of Brooklyn Animal Action");
    }

    function testGetTnr() public {
        Charity cha = new Charity();
        string memory expected = "What is TNR? Hundreds of thousands of stray cats live on Brooklyn’s streets. Some are friendly, but others have been on their own too long to go back to living with humans. They live in colonies, surviving as best they can. In the past, these unadoptable animals would often be caught and killed. But that’s not only cruel, it simply doesn’t work: more cats arrive to fill up the vacuum. So what can be done? More and more municipalities, including New York, now endorse “Trap, Neuter, Return,” or TNR. Neighborhood volunteers, aided by animal rescue organizations, trap the cats in a colony and have them neutered or spayed. They are then “eartipped” – the tip of one ear removed painlessly – for identification as part of a TNR colony. Young kittens and friendly animals are adopted out. The rest are returned to wherever they were found – often a backyard, building courtyard, park or alleyway. Volunteers “manage” the colony, ensuring that the cats are regularly fed and warm shelters provided. Because they are not reproducing, the colony will eventually reduce naturally.";
        string memory result = cha.getTnr();
        Assert.equal(expected, result, "should return Tnr about Brooklyn Animal Action");
    }
}