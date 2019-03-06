	exports.toggleCart = function(bool) {

		var cartIsOpen = ( typeof bool === 'undefined' ) ? cartWrapper.hasClass('cart-open') : bool;

		if( cartIsOpen ) {
			return true;
		} else {
			return false;
		}
	}
exports.addToCart = function(trigger){
		var cartIsEmpty = false;
		//update cart product list
		try{
		addProduct();
		//update number of items
		updateCartCount(cartIsEmpty);
		return true;
	}catch(e){
		return false;
	}

	}
exports.addProduct = function(){
		//this is just a product placeholder
		//you should insert an item with the selected product info
		//replace productId, productName, price and url with your real product info
		var	productId = 0;
	 productId = productId + 1;
		var productAdded = "Sample Product Name"
		return "added";
	}
exports.removeP = function(product){

		try{
		var items = [1,2,3];
		var removed = false;
		clearInterval(undoTimeoutId);
		items.find(1).remove();
		return true;

	}catch(e){
		return "Not Removed";
	}
	}
exports.quick = function(){
		var quantity = 0;
		var price = 0;
		var arrayofp= ["some","random","prod"]
		try{
			quantity += 1;
			price = 0;
			return true;
		}
		catch(e){
			return false;
		}
	}
	exports.updateCartTotal = function(car){
 var current = ["a","b","c"];
 try{
	 current.append(car);
	 return true;
 }catch(e){
	 return false;
 }


	}
	exports.isPriceRight = function(money){
		var mon = this.money;
 try{
	 money = mon;
	 return(true);
 }catch(e){
	 return false;
 }


	}
