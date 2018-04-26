<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- spring tag -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
<html>
	<title>Details</title>
</html>
    
 <div class="container-wrapper">
 	<div class="container">
		<div class = "page-header">
			<h1>Details of Books</h1>
			
			<p class = "lead">You can find the related information about the books!! </p>
		</div>	
			
			<div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
		      <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-left overflow-hidden">
		       	<div class = "container" ng-app = "cartApp" > 
		       	 <div class="row">
				    <%-- <div class="col">
				     	<img class =" rounded float-left" alt="madan" src="<c:url value="/resources/images/madan.jpg"/>" style= "width:80%; height: 400px;" />
				    </div> --%>
				    <div class="col-7 text-align-left" >
				      <h3> <strong>Book Name: </strong>${product.name}</h3>
				      <h3> <strong>Category&nbsp;&nbsp;&nbsp; : </strong>${product.category}</h3>
				      <h3><strong>Written By&nbsp;: </strong>${product.authorName}</h3>
				      <h3><strong>Condition&nbsp;&nbsp;: </strong>${product.condition}</h3>
				      <h3> <strong>Price
				      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
				      </strong>${product.price} USD</h3>
				      <h3><strong>Publisher&nbsp;&nbsp;&nbsp; : </strong>${product.publication}</h3>
				      <h3><strong>Available&nbsp;&nbsp;&nbsp; : </strong>${product.unitInStock}</h3>
				      
				    </div>
				      <br>
				      
				     <div class="col-5 align-self-end">
				      <c:set var="role" scope="page" value="${param.role}" />
				      
				      <c:set var="url" scope="page" value="/product/productList" />
				      
				      <c:if test="${role='admin'}">
				      	<c:set  var="role" scope="page" value="/admin/productInventory" />
				      </c:if>
				      
				      <p data-ng-controller="cartCtrl">
				      	<a href="<c:url value= '${url}' />" class = "btn btn-outline-info">Back</a>
				      	<a href="#" class = "btn btn-outline-warning btn-large" data-ng-click="addToCart('${product.id}')">
				      	<span class = "fa fa-cart-arrow-down" ></span>&nbsp;Order Now</a>
				      	
				      	<a href= "<spring:url value="/customer/cart" />" class="btn btn-outline-success"> 
				      		<span class="fa fa-shopping-cart"></span>&nbsp;View Cart
				      	</a>
				      </p>
				    </div>
				 </div>
		       	
		      </div>
		   <!--  <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">  
		      <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
		        <div class="my-3 p-3">
		          <h2 class="display-5">Another headline</h2>
		          <p class="lead">And an even wittier subheading.</p>
		        </div>
		        <div class="bg-dark box-shadow mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
		      </div>
		      </div> -->
		    </div>
			
		</div>
	</div>
	</div>
	
		<!-- Script File -->
		<script src= "<c:url value="/resources/js/controller.js" />" ></script>
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 