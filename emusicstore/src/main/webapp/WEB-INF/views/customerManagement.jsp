<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
    <!-- just for title -->
    <html>
   		 <title> Customer </title>
    </html>
    
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
 <div class="container-wrapper">
 	<div class="container"> 
	
		<div class = "page-header">
			<h1>Customer Management</h1>
			
			<p class = "lead">Available Customers </p>
			
			

			<table class="table table-hover">
			  <thead class="thead-dark">
			    <tr>
				
			      <th scope="col">Name</th>
			      <th scope="col">Email</th>
			      <th scope="col">Phone Number</th>
			      <th scope="col">Username</th>
			      <th scope="col">Enabled</th>
			      
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  
			  <c:forEach items="${customerList}" var="customer">
			  <tbody>
			    <tr>
			      <td>${customer.customerName}</td>
			      <td>${customer.customerEmail}</td>
			      <td>${customer.customerPhone}</td>
			      <td>${customer.username}</td>
			      <td>${customer.enabled}</td>
			      
			    </tr>
			    </tbody>
			    </c:forEach>
			    
			</table>
		</div>
		
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 