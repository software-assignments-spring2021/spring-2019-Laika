var assert = require("assert")
var x = require("../src/js/maTest")
// var expect = require('chai').expect;

var car = false;
describe("toggleCart", function() {
	it("returns a boolean with the defined cart state", function(done) {
		assert.equal(x.toggleCart(car), false)
				done();
	})

})
describe("addToCart", function() {
	it("returns a boolean if item was successfully added", function(done) {
		assert.equal(x.addToCart(!(car)), false)
				done();
	})

})
describe("addProduct", function() {
	it("returns a string if item was successfully counter up in the cart", function(done) {
		assert.equal(x.addProduct(), "added")
				done();
	})

})
describe("removeP", function() {
	it("returns a string if item was successfully removed in the cart, will return false in this case", function(done) {
		assert.equal(x.removeP(), "Not Removed")
				done();
	})

})
describe("quick", function() {
	it("Checks to see if an item can easily be changed", function(done) {
		assert.equal(x.quick(), true)
				done();
	})

})
describe("updateCartTotal", function() {
	it("Checks to see if cart can easily be updated by appending an item", function(done) {
		assert.equal(x.updateCartTotal(), false)
				done();
	})

})
describe("isPriceRight", function() {
	it("Checks to see if price passed is correct", function(done) {
		assert.equal(x.isPriceRight(10), true)
				done();
	})

})
