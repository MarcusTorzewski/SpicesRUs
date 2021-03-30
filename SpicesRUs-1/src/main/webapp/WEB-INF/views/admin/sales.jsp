<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Spices R Us</title>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  padding: 25px;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<link rel="stylesheet" href="/resources/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400&display=swap"
	rel="stylesheet" />
	<link rel="stylesheet" href="/resources/css/gridLayout.css">
	

</head>
<body>
	<ul class="nav">
		<div id="logo">
			<a href="/"> <img height="70px"
				src="${pageContext.request.contextPath}/images/SpicesRUs_logo.png" />
			</a>
		</div>
		<li><a href="/about">About Us</a></li>
		<li><a href="/spices"
			style="text-decoration: underline rgb(68, 68, 68);">Spices</a></li>
		<li><a href="/recipes">Recipes</a></li>
		<li><a href="/favourites">Favourites</a></li>
		<li><a href="#">Discussion Forum</a></li>
		<sec:authorize access="hasRole('MEMBER')">
      	<li><a href="/account">My Account</a>
    	<li><a href="/logout">Sign Out</a>
    	</sec:authorize>
	  	<sec:authorize access="!hasRole('MEMBER')">
      	<li><a href="/login-form">Sign-in</a></li>
    	</sec:authorize>
		<li><a href="/basket">Basket</a></li>
		
	</ul>

	<div class="banner">
		<img class="banner-image" style="margin-bottom: 200px;"
			src="${pageContext.request.contextPath}/images/spices_background.jpg" />
	</div>
	
	<h1>Total Sales: ${totalSales} </h1>
	
	<h1> Total Orders: ${orderCount} </h1>
	
	
	<table>
	
		<tr>
    		<th>Order</th>
    		<th>Name</th>
    		<th>CCNum</th>
    		<th>Order Total</th>		
  		</tr>
  		
  		
	
		<c:forEach items="${sales}" var="sale">
		
		<tr>
    		<td>${sale.id}</td>
    		<td>${sale.name}</td>
    		<td>${sale.ccNumber}</td>
    		<td>${sale.totalValue}</td>
  		</tr>
		
		</c:forEach>
	
	</table>
	
	
	

	
	
</body>
</html>