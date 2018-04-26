<!-- taglib for jstl to point C as a URL -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="shortcut icon" href="/a_s_favicon.ico"  type="image/x-icon">

	<!-- font awesome -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	
	<!-- Angular -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	
	<!--  Jquery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	
	<!--  Data Tables -->
	<script type="text/javascript" src = "https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js" ></script>
	 
	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
	 -->
	
	<!-- Bootstrap core CSS -->
	<link href= "<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href= "<c:url value="/resources/css/product.css" />" rel="stylesheet">

	<!-- data tables CSS -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css"/>
  </head>

  <body>

    <nav class="site-header sticky-top py-1">
      <div class="container d-flex flex-column flex-md-row justify-content-between">
        <a class="py-2" href="<c:url value="/" />">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
        </a>
        <a class="py-2 d-none d-md-inline-block" href=" <c:url value="/product/productList" /> ">Product</a>
        
     	 <a class="py-2 d-none d-md-inline-block" href=" <c:url value="/about" /> ">About Us</a>
        
        <c:if test="${pageContext.request.userPrincipal.name != null}">
        	<a class="py-2 d-none d-md-inline-block" href=""> Welcome: ${pageContext.request.userPrincipal.name} </a>
        	<!-- Logout Button -->
 
        	<c:url var="logoutUrl" value="/j_spring_security_logout"/>
				<form action="${logoutUrl}" method="post">
			<a class="py-2 d-none d-md-inline-block">
				<input type="submit" value="Logout" class="btn btn-secondary btn-sm" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</a>
				</form>
			
        	<c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
        		<a class="py-2 d-none d-md-inline-block" href="<c:url value="/customer/cart" />">Cart</a>
        	</c:if>
        	
        	<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
        		<a class="py-2 d-none d-md-inline-block" href="<c:url value="/admin" />">Admin</a>
        	</c:if>
        </c:if>
        
         <c:if test="${pageContext.request.userPrincipal.name == null}">
	         <a class="py-2 d-none d-md-inline-block " href="<c:url value="/login" />"><span class="fa fa-sign-in" data-toggle="tooltip" data-placement="top" title="Login"></span></a>
	       	 <a class="py-2 d-none d-md-inline-block " href="<c:url value="/register" />"><span class="fa fa-user-circle" data-toggle="tooltip" data-placement="top" title="Customer Register"></span></a>
	      </c:if> 
    
      </div>
    </nav>
    
     
        
