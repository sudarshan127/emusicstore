

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
    <!-- just for title -->
    <html>
   		 <title> Admin </title>
    </html>
    
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
 <div class="container-wrapper">
 	<div class="container"> 
	
		<div class = "page-header">
			<h1>Administrator Page</h1>
			
			<p class = "lead">Adminstrator</p>
		</div>
		
		<c:if test="${pageContext.request.userPrincipal.name !=null}">
			<h2>
				Welcome: ${pageContext.request.userPrincipal.name} | 
				<!-- Logout Button -->
        	<!-- style needed -->
        	<c:url var="logoutUrl" value="/j_spring_security_logout"/>
				<form action="${logoutUrl}" method="post">
				<input type="submit" value="Logout" class="btn btn-primary" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
		
			</h2>
		
		</c:if> 
		<h3>
			<a href = "<c:url value="/admin/productInventory" /> ">Product Inventory</a>
		</h3>
		
		<p> View and Modify the Product Inventory </p>
		<br>
		<h3>
			<a href = "<c:url value="/admin/customer" /> ">Customer Management</a>
		</h3>	
		
		<p> View Customer </p>
		
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 