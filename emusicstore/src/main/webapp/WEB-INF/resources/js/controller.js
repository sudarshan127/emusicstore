/**
 * 
 */
var cartApp = angular.module("cartApp", []);

cartApp.controller("cartCtrl", function ($scope, $http) {
	
	$scope.refreshCart = function () {
		
		$http.get("/emusicstore/rest/cart/" + $scope.cartId).then(function (data){
			
			$scope.cart=data;
		});
	};
	
	$scope.clearCart = function () {
		$http.delete("/emusicstore/rest/cart/" + $scope.cartId).then($scope.refreshCart());
	};
	
	$scope.initCartId = function (cartId) {
		$scope.cartId = cartId;
		$scope.refreshCart(cartId);
	};
	
	$scope.cart=[
		{ 
	        "price":250,
	        "name": "sun1",
	        "quantity": 250,
	        "totalPrice": 250,
	       
	    },
	      { 
	        "price":250,
	        "name": "sun1",
	        "quantity": 250,
	        "totalPrice": 250,
	       
	    }]
				
	
	
	
	
	
	
	
	
	
	
	
	
	$scope.addToCart = function (id) {
		$http.get("/emusicstore/rest/cart/add/" + id).then(function (){
			alert("Product Successfully Added to The Cart!")
			
		});
		
	};
	
	$scope.removeFromCart = function (cartId) {
		$http.put("/emusicstore/rest/cart/remove/" + cartId).then(function (data) {
			$scope.refreshCart();
			alert("Product Successfully Removed from The Cart!")
		});
		
	};
	
	$scope.calGrandTotal = function () {
		
		var grandTotal = 0;
		
		for (var i=0; i<$scope.cart.length; i++) {
			
			grandTotal += $scope.cart[i].totalPrice; 
		}
		
		return grandTotal;
	};
});