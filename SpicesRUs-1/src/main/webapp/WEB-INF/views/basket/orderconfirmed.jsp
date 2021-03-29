
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Spices R Us</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/recipe_page.css">
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400&display=swap"
	rel="stylesheet" />
</head>

<style>

.box{

	border: 3px solid black;

}
.listItem{
	
	padding: 15px;
	


}
.h2{

	font-size: 40px;
	


}

.h3{

	font-size: 40px;
	
}

.h4{

	font-weight: bold;
	
}	

.pageButton{

	background-color: #999999;
  	border: 3px solid black;
  	padding: 10px 20px;
  	text-align: center;
  	display: inline-block;
  	font-size: 18px;
}

.spacing{
	padding:15px;

}







</style>
<body>
	<div>
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
			<img class="banner-image"
				src="${pageContext.request.contextPath}/images/spices_background.jpg" />
		</div>

		<!-- Top info section -->

		<div class="top_section">
		
			<p1>Your order id is: ${orderNumber}</p1>
				
			

			</div>
			
			
			
</body>
</html>


