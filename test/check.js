
function checkName(nelem){
    if (nelem != null){
        return true;
    }else{
        return false;
    }
}
function validateName() {

    var name = "test";
  
    if (name.match(/^[A-Za-z]*\s{1}[A-Za-z]*$/)) {
      return false;
    }
    return true;
  }
  
  
module.exports = {
    checkName,
    validateName,
}