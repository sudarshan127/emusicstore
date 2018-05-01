<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- spring tag -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>

<!-- Font Awesome Icon -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<div class = "container-wrapper" >
	<div class = "container">
		<section>
			<div class = "jumbotron">
				<div class = "container">
					<h1>Cart</h1>
					
					
					<p>Your Products</p>
				</div>
			</div>
		</section>
	
	
		<section class = "container" data-ng-app="cartApp">
		
			<div data-ng-controller= "cartCtrl" data-ng-init= "initCartId('${cartId}')">
			<div>
				<a class = "btn btn-danger pull-left" data-ng-click="clearCart()" ><span class= "fa fa-trash"></span>Clear Cart</a>
				
				<a href="<spring:url value='/order/${cartId}' />" 
					class="btn btn-success pull-right" > <span class="fa fa-shopping-cart"></span>Check Out</a>
			</div>
		
			<table class ="table table-hover">
			<!--	<tr>
					<th>Product</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
				
				 <tr data-ng-repeat = "item in cart">
					<td>{{item.product.name}}</td>
					<td>{{item.product.price}}</td>
					<td>{{item.quantity}}</td>
					<td>{{item.totalPrice}}</td>
					<td><a href="#" class="label label-danger" data-ng-click="removeFromCart(product.id)">
						<span class="fa fa-trash"></span>remove</a></td>
						
						
				</tr> -->
				<tr>
					<th>Product</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					
				</tr>
				<tr >
					<td>${name}</td>
					<td>${price}</td>
					<td>${quant}</td>
					
					<td><a href="#" class="label label-danger" data-ng-click="removeFromCart(product.id)">
						<span class="fa fa-trash"></span>remove</a></td>
						
						
				</tr>
				
				<tr>
					<th></th>
					<th></th>
					<th>Grand Total</th>
					<th>{{calGrandTotal()}}</th>
					<th></th>
					
				</tr>
			</table>
			
			<a href="<spring:url value= "/product/productList" />" class="btn btn-default">Continue Shopping</a>
			</div>
		</section>
	</div>

</div>

<!-- Script File -->
		<script src= "<c:url value="/resources/js/controller.js" />" ></script>	

 <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   