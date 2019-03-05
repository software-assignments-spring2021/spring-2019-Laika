var assert = require("assert");
//var todo = require("validation");

describe("isComplete", function(){
    it("checks to see if all fields were filled out", function(done){
        assert.equal(isComplete(), true);
        done();
    });
});

describe("isEmail", function(){
    it("checks to see email is valid", function(done){
        assert.equal(isEmail("test@gmail.com"), true);
        assert.equal(isEmail("testgmail.com"), false);
        assert.equal(isEmail("test@gmailcom"), false);
        done();
    });
});

describe("isFullName", function(){
    it("checks to see name is valid", function(done){
        assert.equal(isEmail("John Doe"), true);
        assert.equal(isEmail("JohnDoe"), false);
        assert.equal(isEmail("John"), false);
        done();
    });
});