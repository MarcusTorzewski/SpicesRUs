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
<div>
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
	
	<div style="width:100%; overflow: hidden; padding:2% 5% 3% 5%; background-color: #fdedce;">
		<div style="width: 30%; float:left;">
			<img style="border-right:10%;" src="${recipe.image}">
		</div>
		<div style="margin-left:30%; width:45%">
			<h1 style="display: inline; border-bottom:2px solid; border-color:#f9c86c; padding:10px 0px 10px 0px;">${recipe.name}</h1>
			<p style="padding: 10px 0 10px 0;'">${recipe.description}</p>
			<p><b>Serving:</b> ${recipe.servings}</p>
			<p><b>Difficulty:</b> ${recipe.difficulty}</p>
			<p style="display:inline;"><b>Prep time:</b> ${recipe.prep_time}</p>
			<p style="display:inline"><b>Cooking time:</b> ${recipe.cooking_time}</p>
			<table style="padding-top:15px">
				<tbody style="display:inline-flex; flex-wrap:wrap; align-items:flex-start; font-size:13px">
					<tr style="display:flex; text-align:center; flex-direction:column; word-break:break-all; border-style:solid; border-color:black; border-width:1px; background-color:white; min-width:70px;">
						<td style="padding:5px; border-bottom-style:solid; border-bottom-width:1px;">cal</td>
						<td style="padding:5px;">${recipe.calories}</td>
					</tr>
					<tr style="display:flex; text-align:center; flex-direction:column; word-break:break-all; border-style:solid; border-color:black; border-width:1px; background-color:white; min-width:70px;">
						<td style="padding:5px; border-bottom-style:solid; border-bottom-width:1px;">fat</td>
						<td style="padding:5px;">${recipe.fat}g</td>
					</tr>
					<tr style="display:flex; text-align:center; flex-direction:column; word-break:break-all; border-style:solid; border-color:black; border-width:1px; background-color:white; min-width:70px;">
						<td style="padding:5px; border-bottom-style:solid; border-bottom-width:1px;">saturates</td>
						<td style="padding:5px;">${recipe.saturates}g</td>
					</tr>
					<tr style="display:flex; text-align:center; flex-direction:column; word-break:break-all; border-style:solid; border-color:black; border-width:1px; background-color:white; min-width:70px;">
						<td style="padding:5px; border-bottom-style:solid; border-bottom-width:1px;">sugars</td>
						<td style="padding:5px;">${recipe.sugars}g</td>
					</tr>
					<tr style="display:flex; text-align:center; flex-direction:column; word-break:break-all; border-style:solid; border-color:black; border-width:1px; background-color:white; min-width:70px;">
						<td style="padding:5px; border-bottom-style:solid; border-bottom-width:1px;">salt</td>
						<td style="padding:5px;">${recipe.salt}g</td>
					</tr>
					<tr style="display:flex; text-align:center; flex-direction:column; word-break:break-all; border-style:solid; border-color:black; border-width:1px; background-color:white; min-width:70px;">
						<td style="padding:5px; border-bottom-style:solid; border-bottom-width:1px;">protein</td>
						<td style="padding:5px;">${recipe.protein}g</td>
					</tr>
					<tr style="display:flex; text-align:center; flex-direction:column; word-break:break-all; border-style:solid; border-color:black; border-width:1px; background-color:white; min-width:70px;">
						<td style="padding:5px; border-bottom-style:solid; border-bottom-width:1px;">carbs</td>
						<td style="padding:5px;">${recipe.carbs}g</td>
					</tr>
					<tr style="display:flex; text-align:center; flex-direction:column; word-break:break-all; border-style:solid; border-color:black; border-width:1px; background-color:white; min-width:70px;">
						<td style="padding:5px; border-bottom-style:solid; border-bottom-width:1px;">fibre</td>
						<td style="padding:5px;">${recipe.fibre}g</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	
	<hr style="color: #f6ac23; height:5px; background-color: #f6ac23; border-width:0;'">
	
	
	<!-- Ingredients and Method section -->
	
	
	 <div style="width: 100%; overflow: hidden; padding: 0 5% 0 5%; background-color: #fdedce;">
     	<div style="width: 20%; float: left;">
     	
     		<h2>Ingredients</h2>
	     	<ul>
				<c:forEach items="${recipe.ingredients}" var="ingredient">
					<li style="border-bottom:2px solid; border-color:#f9c86c; padding:10px 0px 10px 0px;">${ingredient}</li>
				</c:forEach>
			</ul>
     	
     	</div>
     	<div style="margin-left:30%; width:45%">
     	
     		<h2>Method</h2>
			<ol>
				<c:forEach items="${recipe.method}" var="step">
					<li style=" padding:10px 0px 10px 0px;">${step}</li>
				</c:forEach>
			</ol>
     	
     	</div>
	</div>
</div>


	
	
	
	
</body>
</html>
