pragma solidity ^0.5.0;

contract CharityFactory {

    address[] charities;

    function createChildContract(string memory shortIntro, string memory about) public returns (bool){
        Charity newCharity = new Charity(shortIntro, about, msg.sender);
        charities.push(address(newCharity));
        return true;
    }

}

contract Charity {
    string public shortIntro;
    string public about;
    address public owner;

    constructor (string memory _shortIntro, string memory _about, address _owner) public {
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

    function getOwner() public view returns (address){
        return (owner);
    }

}