<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Spices R Us</title>
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
		<li><a href="#">Basket</a></li>
	</ul>

	<div class="banner">
		<img class="banner-image"
			src="${pageContext.request.contextPath}/images/spices_background.jpg" />
	</div>
	
	<!-- Recipes -->
	
	<div class="gridSection">
		<h1 class="h1">Check Out Our Spices</h1>
		<div class="grid-container">
			<c:forEach items="${spices}" var="spice">
				<a href="spices/${spice.name}" style="text-decoration: none; color:black;">
					<div class="grid-item">
					<img style="width:206px;height:200px;object-fit:cover;" src="${spice.image}">
					${spice.name}
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	
</body>
</html>
