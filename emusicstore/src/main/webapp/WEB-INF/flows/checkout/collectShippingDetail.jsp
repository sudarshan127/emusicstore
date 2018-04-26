<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
    <html>
    	<title>Customer</title>
    </html>
    
 <div class="container-wrapper">
	<div class="container"> 
		<div class = "page-header">
			<h1>Customer </h1>
			
			<p class = "lead">Customer Details</p>
			
		</div>
	
	<form:form modelAttribute="order" class="form-horizaontal"> <!-- we can use modelAttribute instead of commandName -->
			
			
	<h3>Shipping Address</h3>
			
		<div class="form-row">
   		 <div class="form-group col-md-6">	
			<div class="form-group">
				<label for="shippingStreet">Street Name</label>
				<br>
				<form:input path="cart.customer.shippingAddress.streetName" id="shippingStreet" class="form-Control" placeholder="Street Name"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingApartmentNumber">Apt Number</label>
				<br>
				<form:input path="cart.customer.shippingAddress.apartmentNumber" id="shippingApartmentNumber" class="form-Control" placeholder="Apt Number"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingCity">City</label>
				<br>
				<form:input path="cart.customer.shippingAddress.city" id="shippingCity" class="form-Control" placeholder="City"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingState">State</label>
				<br>
				<form:input path="cart.customer.shippingAddress.state" id="shippingState" class="form-Control" placeholder="State"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingCountry">Country</label>
				<br>
				<form:input path="cart.customer.shippingAddress.country" id="shippingCountry" class="form-Control" placeholder="Country"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingZip">Zip Code</label>
				<br>
				<form:input path="cart.customer.shippingAddress.zipCode" id="shippingZip" class="form-Control" placeholder="Zip Code"/>
			</div>
		</div>
		</div>	
		
			<input type="hidden" name="_flowExecutionKey" /> 
			<br>
			<button class="btn btn-default" name="_eventId_backToCollectCustomerInfo">Back</button>
			<input type="submit" value = "Next" class="btn btn-primary" name="_eventId_shippingDetailCollected" />
			<button class="btn btn-default" name="_eventId_cancel">Cancel</button>
			
		</form:form>
	</div>
</div>	
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 