var assert = require("assert");
var x = require("./check.js");

var name;
describe("checkName", function(name) {
	it("check if there is any input in name field", function(done) {
        assert.equal(x.checkName('kdk'), true)
        assert.equal("", false)
		done();
	})
})
describe("validateName", function() {
	it("check if the name is valid", function(done) {
        assert.equal('', false)
		assert.equal(x.validateName(), true)
		done();
	})
})
