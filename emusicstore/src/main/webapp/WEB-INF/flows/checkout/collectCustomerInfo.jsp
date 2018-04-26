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
			
			<h3>Basic Information</h3>
			
	<div class="form-row">
   		 <div class="form-group col-md-12">
			<div class="form-group">
				<label for="name">Name:</label>
				<br>
				<form:input path="cart.customer.customerName" id="name" class="form-Control" placeholder="Full Name" name = "name"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">	
			<div class="form-group">
				<label for="email">Email:</label>
				<br>
				<form:input path="cart.customer.customerEmail" id="email" class="form-Control" placeholder="email@example.com" name = "email"/>
			</div>
		</div>
		
		<div class="form-group col-md-4">	
			<div class="form-group">
				<label for="phone">Phone Number:</label>
				<br>
				<form:input path="cart.customer.customerPhone" id="phone" class="form-Control" placeholder="Phone Number"/>
			</div>
		</div>
			
		
	</div>	
			<h3>Billing Address</h3>
		<div class="form-row">
   		 <div class="form-group col-md-6">	
			<div class="form-group">
				<label for="billingStreet">Street Name</label>
				<br>
				<form:input path="cart.customer.billingAddress.streetName" id="billingStreet" class="form-Control" placeholder="Street Name"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingApartmentNumber">Apt Number</label>
				<br>
				<form:input path="cart.customer.billingAddress.apartmentNumber" id="billingApartmentNumber" class="form-Control" placeholder="Apt Number"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingCity">City</label>
				<br>
				<form:input path="cart.customer.billingAddress.city" id="billingCity" class="form-Control" placeholder="City"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingState">State</label>
				<br>
				<form:input path="cart.customer.billingAddress.state" id="billingState" class="form-Control" placeholder="State"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingCountry">Country</label>
				<br>
				<form:input path="cart.customer.billingAddress.country" id="billingCountry" class="form-Control" placeholder="Country"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingZip">Zip Code</label>
				<br>
				<form:input path="cart.customer.billingAddress.zipCode" id="billingZip" class="form-Control" placeholder="Zip Code"/>
			</div>
		</div>
		</div>	
		
			<input type="hidden" name="_flowExecutionKey" /> 
			<br>
			<input type="submit" value = "Next" class="btn btn-primary" name="_eventId_customerInfoCollected" />
			<button class="btn btn-default" name="_eventId_cancel">Cancel</button>
			
		</form:form>
	</div>
</div>	
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 