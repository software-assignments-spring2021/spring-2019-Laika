pragma solidity ^0.5.0;

contract CharityFactory {

    address[] charities;

    function createChildContract(string memory shortIntro, string memory about) public {
        address newCharity = new Charity(shortIntro, about, msg.sender);
        charities.push(newCharity);
    }
}

contract Charity {
    string public shortIntro;
    string public about;
    address public owner;

    function setCharity(string _shortIntro, string _about, string _owner) public {
        shortIntro = _shortIntro;
        about = _about;
        owner = _owner;
    }

    function getShortIntro() public view returns (string memory){
        return (shortIntro);
    }

    function getAbout() public view returns (string memory){
        return (about);
    }

    function getOwner() public view returns (string memory){
        return (owner);
    }

}