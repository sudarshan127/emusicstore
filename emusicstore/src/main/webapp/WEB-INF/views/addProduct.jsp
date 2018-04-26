<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
 
    	<title>Add Books</title>
 
    
 <div class="container-wrapper">
		<div class="container">
			<div class = "page-header">
				<h1>Add Books</h1>
				
				<p class = "lead">You can add new book into a system!! </p>
				
			</div>
		
			<form:form action="${pageContext.request.contextPath}/adminProd/product/addNewProduct?${_csrf.parameterName}=${_csrf.token}" 
				 method ="POST" modelAttribute="product" >
			 <!-- we can use modelAttribute instead of commandName -->
			
		<div class="form-row">
				<div class="form-group col-md-12">	
					<div class="form-group">
						<label for="name">Name</label> <form:errors path="name" cssStyle="color:#ff0000" />
						<br>
						<form:input path="name" id="name" class="form-Control" placeholder="Book Name" name = "name"/>
					</div>
				</div>
		
				<div class="form-group col-md-6">	
					<div class="form-group">
						<label for="category">Category</label>
						<br>
						<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Romance" name = "category"/>Romance</label>
						<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Comedy" name = "category"/>Comedy</label>
						<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Thriller" name = "category"/>Thriller</label>
						<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Drama" name = "category"/>Drama</label>
					</div>
				</div>
		
		
				<div class="form-group col-md-6">
					<div class="form-group">
						<label for="authorName">Author Name</label> <form:errors path="authorName" cssStyle="color:#ff0000" />
						<br>
						<form:input path="authorName" id="authorName" class="form-Control" placeholder="Author Name" name = "authorName"/>
					</div>
				</div>
		
				<div class="form-group col-md-6">	
					<div class="form-group">
						<label for="condition">Condition</label>
						<br>
						<label class = "checkbox-inline"><form:radiobutton path="condition" id="condition" value="New" name = "condition"/>New</label>
						<br/>
						<label class = "checkbox-inline"><form:radiobutton path="condition" id="condition" value="Old" name = "condition"/>Old</label>
					</div>
				</div>
		
				<div class="form-group col-md-6">	
					<div class="form-group">
						<label for="price">Price</label> <form:errors path="price" cssStyle="color:#ff0000" name = "price"/>
						<br>
						<form:input path="price" id="price" class="form-Control" placeholder="Price" name = "price"/> <label>USD</label>
					</div>
				</div>
		
				<div class="form-group col-md-6">	
					<div class="form-group">
						<label for="publication">Publication</label>
						<br>
						<form:input path="publication" id="publication" class="form-Control" placeholder="Publication Name" name = "publication"/>
					</div>
					
				</div>
			
				<div class="form-group col-md-6s">	
					<div class="form-group">
						<label for="unitInStock">Unit In Stock</label> <form:errors path="unitInStock" cssStyle="color:#ff0000" />
						<br>
						<form:input path="unitInStock" id="unitInStock" class="form-Control" placeholder="Available Unit In Stock" name = "unitInStock"/>
					</div>
				</div>	
						<!-- <div class="form-group">
							<label class = "control-label" for="file">Upload Image</label>
							<input type ="file" id="file" name ="file" />
						</div> -->
		</div>		
	

			<br><br>
			<input type="submit" value = "submit" class="btn btn-primary" >
			
			<a href="<c:url value="/admin/productInventory" />" class="btn btn-primary" >Cancel</a>
			
	
			</form:form>
		</div>
</div>		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 