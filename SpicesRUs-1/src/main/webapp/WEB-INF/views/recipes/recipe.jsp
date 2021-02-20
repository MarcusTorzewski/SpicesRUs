<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Spices R Us</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400&display=swap"
	rel="stylesheet" />
</head>
<body>
	<ul class="nav">
		<div id="logo">
			<a href="/"> <img height="70px"
				src="${pageContext.request.contextPath}/images/SpicesRUs_logo.png" />
			</a>
		</div>
		<li><a href="/about">About Us</a></li>
		<li><a href="/spices">Spices</a></li>
		<li><a href="/recipes"
			style="text-decoration: underline rgb(68, 68, 68);">Recipes</a></li>
		<li><a href="#">Discussion Forum</a></li>
		<li><a href="#">Sign-in</a></li>
		<li><a href="#">Basket</a></li>
	</ul>

	<div class="banner">
		<img class="banner-image"
			src="${pageContext.request.contextPath}/images/spices_background.jpg" />
	</div>
	
	<!-- Top info section -->
	
	<div style="width:100%; overflow: hidden; padding:1% 5% 3% 5%; background-color: #fdedce;">
		<div style="width: 30%; float:left;">
			<img src="${recipe.image}">
		</div>
		<div style="float: right; width:70%">
			<h1>${recipe.name}</h1>
			<p>Serving: ${recipe.servings}</p>
			<p>Difficulty: ${recipe.difficulty}</p>
			<p>Prep time: ${recipe.prep_time}</p>
			<p>Cooking time: ${recipe.cooking_time}</p>
		</div>
	</div>
	
	
	<hr style="color: #f6ac23; height:0.1px; background-color: #f6ac23; border-width:0;'">
	
	
	<!-- Ingredients and Method section -->
	
	
	 <div style="width: 100%; overflow: hidden; padding: 0 5% 0 5%; background-color: #fdedce;">
     	<div style="width: 20%; float: left;">
     	
     		<h2>Ingredients</h2>
	     	<ul>
				<c:forEach items="${recipe.ingredients}" var="ingredient">
					<li style="border-bottom:2px solid; border-color:#f9c86c; padding:6px 0px 6px 0px;">${ingredient}</li>
				</c:forEach>
			</ul>
     	
     	</div>
     	<div style="float: right; width: 70%;">
     	
     		<h2>Method</h2>
			<ol>
				<c:forEach items="${recipe.method}" var="step">
					<li style=" padding:10px 0px 10px 0px;">${step}</li>
				</c:forEach>
			</ol>
     	
     	</div>
	</div>


	
	
	
	
</body>
</html>
