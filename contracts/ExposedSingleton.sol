pragma solidity ^0.5.0;
import "./HomeSingleton.sol";

contract ExposedSingleton {
  string public name;
  string public description;
  string public about;
  address public owner;
  bool private _instantiated;
  HomeSingleton private _myHome;

  function callCreate() private returns (HomeSingleton){
    HomeSingleton thisHome = new HomeSingleton(name, description, about, msg.sender);
    return thisHome;
  }

  //creates and checks for instance
  function getInstance() public returns (HomeSingleton) {
    if (_instantiated == false){
      _instantiated = true;
      HomeSingleton thisHome = callCreate();
      _myHome = thisHome;
    }
    return _myHome;
  }

  function isInstantiated() public view returns (bool) {
    return _instantiated;
  }

}
