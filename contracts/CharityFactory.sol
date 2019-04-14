pragma solidity ^0.5.0;

contract CharityFactory {

    address[] charities;

    fuction createChildContract ()

    function getShortIntro() public view returns (string memory){
        return (shortIntro);
    }

}

contract Charity {
    string public shortIntro;
    string public about;

    function setCharity(string _shortIntro, string _about) public {
        shortIntro = _shortIntro;
        about = _about;
    }

    function getShortIntro() public view returns (string memory){
        return (shortIntro);
    }

    function getAbout() public view returns (string memory){
        return (about);
    }

}