<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
    <html>
    	<title>Edit Details of Books</title>
    </html>
    
 <div class="container-wrapper">
	<div class="container">
		<div class = "page-header">
			<h1>Edit Details</h1>
			
			<p class = "lead">You can edit the details of books into a system!! </p>
			
		</div>
		
		<form:form action="${pageContext.request.contextPath}/adminProd/product/editProduct?${_csrf.parameterName}=${_csrf.token}" 
			method ="POST" modelAttribute="product" > <!-- we can use modelAttribute instead of commandName -->
			<!-- Using GET instead of POST because of errors -->
			<form:hidden path = "id" value="${product.id}" />
			
			<div class="form-row">
				<div class="form-group col-md-12">
					<div class="form-group">
						<label for="name">Name</label>	<form:errors path="name" cssStyle="color:#ff0000" />
						<br>
						<form:input path="name" id="name" class="form-Control" value = "${product.name}"/>
					</div>
				</div>
				
				<div class="form-group col-md-6">
					<div class="form-group">
						<label for="category">Category</label>
						<br/>
						<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Romance" />Romance</label>
						<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Comedy" />Comedy</label>
						<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Thriller" />Thriller</label>
						<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Drama" />Drama</label>
					</div>
				</div>
				
				<div class="form-group col-md-6">
					<div class="form-group">
						<label for="authorName">Author Name</label>	<form:errors path="authorName" cssStyle="color:#ff0000" />
						<br/>
						<form:input path="authorName" id="authorName" class="form-Control" value = "${product.authorName}"/>
					</div>
				</div>
				
				<div class="form-group col-md-6">
					<div class="form-group">
						<label for="condition">Condition</label>
						<br/>
						<label class = "checkbox-inline"><form:radiobutton path="condition" id="condition" value="New" />New</label>
						<br/>
						<label class = "checkbox-inline"><form:radiobutton path="condition" id="condition" value="Old" />Old</label>
					</div>
				</div>
				
				<div class="form-group col-md-6">
					<div class="form-group">
						<label for="price">Price</label>	<form:errors path="price" cssStyle="color:#ff0000" name = "price"/>
						<br/>
						<form:input path="price" id="price" class="form-Control" value = "${product.price}"/> <label>USD</label>
					</div>
				</div>
				
				<div class="form-group col-md-6">
					<div class="form-group">
						<label for="publication">Publication</label>
						<br/>
						<form:input path="publication" id="publication" class="form-Control" value = "${product.publication}"/>
					</div>
				</div>
				
				<div class="form-group col-md-6">
					<div class="form-group">
						<label for="unitInStock">Unit In Stock</label>	<form:errors path="unitInStock" cssStyle="color:#ff0000" />
						<br/>
						<form:input path="unitInStock" id="unitInStock" class="form-Control" value = "${product.unitInStock}"/>
					</div>
				</div>
					<!-- 
					<div class="form-group">
						<label class = "control-label" for="image">Upload Image</label>
						<form:input type ="file" path="image" id="image" class="form:input-large"/>
					</div>
					 -->
			</div>	
			 
			<br><br>
			<input type="submit" value = "submit" class="btn btn-primary" >
			<a href="<c:url value="/admin/productInventory" />" class="btn btn-primary" >Cancel</a>
		</form:form>
	</div>
</div>
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 