<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
    <html>
    	<title>Register</title>
    </html>
<!--     <script>
function validateForm() {
	var text;
    var x = document.getElementById("name").value;
    if (x == null || x == "") {
        text = ("Name must be filled out");
        
    }
    document.getElementById("demo").innerHTML = text;
}
</script> -->
 <div class="container-wrapper">
	<div class="container"> 
		<div class = "page-header">
			<h1>Customer Register</h1>
			
			<p class = "lead">Please provide your information to register as a customer. </p>
			
		</div>
	
	<form:form action="${pageContext.request.contextPath}/register"   method ="POST" modelAttribute="customer" > <!-- we can use modelAttribute instead of commandName -->
			
			<h3>Basic Information</h3>
			
	<div class="form-row">
   		 <div class="form-group col-md-12">
			<div class="form-group">
				<label for="name">Name:</label> <form:errors path="customerName" style="color: red" />
				<br>
				<form:input path="customerName" class="form-Control" placeholder="Full Name" name = "name"/>
				<p id="demo"></p>
			</div>
		</div>
		
		<div class="form-group col-md-6">	
			<div class="form-group">
				<label for="email">Email:</label> <span >${emailMsg}</span>
													<form:errors path="customerEmail" style="color: red" />
				<br>
				<form:input path="customerEmail" class="form-Control" placeholder="email@example.com" name = "email"/>
			</div>
		</div>
		
		<div class="form-group col-md-4">	
			<div class="form-group">
				<label for="phone">Phone Number:</label> <form:errors path="customerPhone" style="color: red" />
				<br>
				<form:input path="customerPhone"  placeholder="Phone Number"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">
			<div class="form-group">
				<label for="username">User Name:</label> <span style="color: red">${usernameMsg}</span>
													<form:errors path="username" style="color: red" />
				<br>
				<form:input path="username" class="form-Control" placeholder="Your Username"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">	
			<div class="form-group">
				<label for="password">Password:</label> 	<span style="color: red">${passwordMsg}</span>
				<form:errors path="password" style="color: red" />
															
				<br>
				<form:password path="password"  id="password" class="form-Control" placeholder="Your password"/>
			</div>
		</div>	
		
	</div>	
			<h3>Billing Address</h3>
		<div class="form-row">
   		 <div class="form-group col-md-6">	
			<div class="form-group">
				<label for="billingStreet">Street Name</label>
				<br>
				<form:input path="billingAddress.streetName" id="billingStreet" class="form-Control" placeholder="Street Name"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingApartmentNumber">Apt Number</label>
				<br>
				<form:input path="billingAddress.apartmentNumber" id="billingApartmentNumber" class="form-Control" placeholder="Apt Number"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingCity">City</label>
				<br>
				<form:input path="billingAddress.city" id="billingCity" class="form-Control" placeholder="City"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingState">State</label>
				<br>
				<form:input path="billingAddress.state" id="billingState" class="form-Control" placeholder="State"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingCountry">Country</label>
				<br>
				<form:input path="billingAddress.country" id="billingCountry" class="form-Control" placeholder="Country"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="billingZip">Zip Code</label>
				<br>
				<form:input path="billingAddress.zipCode" id="billingZip" class="form-Control" placeholder="Zip Code"/>
			</div>
		</div>
		</div>	
			<h3>Shipping Address</h3>
		<div class="form-row">
   		 <div class="form-group col-md-6">	
			<div class="form-group">
				<label for="shippingStreet">Street Name</label>
				<br>
				<form:input path="shippingAddress.streetName" id="shippingStreet" class="form-Control" placeholder="Street Name"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingApartmentNumber">Apt Number</label>
				<br>
				<form:input path="shippingAddress.apartmentNumber" id="shippingApartmentNumber" class="form-Control" placeholder="Apt Number"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingCity">City</label>
				<br>
				<form:input path="shippingAddress.city" id="shippingCity" class="form-Control" placeholder="City"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingState">State</label>
				<br>
				<form:input path="shippingAddress.state" id="shippingState" class="form-Control" placeholder="State"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingCountry">Country</label>
				<br>
				<form:input path="shippingAddress.country" id="shippingCountry" class="form-Control" placeholder="Country"/>
			</div>
		</div>
		
		<div class="form-group col-md-6">		
			<div class="form-group">
				<label for="shippingZip">Zip Code</label>
				<br>
				<form:input path="shippingAddress.zipCode" id="shippingZip" class="form-Control" placeholder="Zip Code"/>
			</div>
		</div>
		</div>	
			
			<br>
			<input type="submit" value = "submit" class="btn btn-primary" >
			<a href="<c:url value="/" />" class="btn btn-primary" >Cancel</a>
			

		</form:form>
	</div>
</div>	
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 