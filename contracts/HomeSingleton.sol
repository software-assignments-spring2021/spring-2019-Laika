pragma solidity ^0.5.0;
//HOME SINGLETON DESIGN PATTERN
contract Home {
  //Home properties
  string public name;
  string public description;
  string public about;
  address public owner;

  //Home constructor
  constructor (string memory _name, string memory _description, string memory _about, address _owner) public {
    name = _name;
    description = _description;
    about = _about;
    owner = _owner;
  }

  //additional functionality
  function getName() public view returns (string memory) {
    return (name);
  }

  function getDescription() public view returns (string memory) {
    return (description);
  }

  function getAbout() public view returns (string memory) {
    return (about);
  }

  function getOwner() public view returns (address) {
    return (owner);
  }
}


//Inheritance allows for using Home functionality
contract HomeSingleton is Home {
  //Singleton variables
  bool private _instantiated = false;
  Home private _myHome;

  //Regulates calling new Home contract
  function callCreate() private returns (Home){
    return new Home(name, description, about, msg.sender);
  }

  //creates and checks for instance
  function getInstance() public returns (Home) {
    if (_instantiated == false){
      _instantiated = true;
      _myHome = callCreate();
    }
    return _myHome;
  }

  function isInstantiated() public view returns (bool) {
    return _instantiated;
  }
}
