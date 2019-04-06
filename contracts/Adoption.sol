pragma solidity ^0.5.0;


contract Adoption {
  address[16] public adopters;   // array of 16 addresses
                                // public vars have get method - but by index!

  // specify types of arg(s) AND return, and specify function access
  function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <=15);   // precondition on arg
    adopters[petId] = msg.sender;       // set to address of caller
    return petId;                      // must return correct type
  }

  // provide get for entire adopters array
  // view is state mutability attrb - the scope of change the function is
  // allowed to make to the Ethereum global state:
  // 'view' functions only return values and do not modify state in any way
  // 'pure' functions are evn more restrictive - they cannot even read the
  // current state
  function getAdopters() public view returns (address[16] memory) {
    return adopters;
  }
}//Adoption
