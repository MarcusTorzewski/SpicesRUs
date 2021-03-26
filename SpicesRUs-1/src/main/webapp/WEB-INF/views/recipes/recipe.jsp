<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
<body>
<div>
	<ul class="nav">
		<div id="logo">
			<a href="/"> 
			<img height="70px"
				src="${pageContext.request.contextPath}/images/SpicesRUs_logo.png" />
			</a>
		</div>
		<li><a href="/about">About Us</a></li>
		<li><a href="/spices">Spices</a></li>
		<li><a href="/recipes"
			style="text-decoration: underline rgb(68, 68, 68);">Recipes</a></li>
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
	
	<!-- Top info section -->
	
	<div class="top_section">
		<div class="left_section">
			<img style="border-right:10%;width:315px;height:315px;object-fit:cover;" src="${recipe.image}">
			<c:if test="${! (favouriteRecipes == null)}">
				<c:if test="${! isFavourited}">
					<form:form action="/addFavouriteRecipe/${recipe.name}">
						<button type="submit" class="button">Favourite</button>
					</form:form>
				</c:if>
				<c:if test="${isFavourited}">
					<form:form action="/removeFavouriteRecipe/${recipe.name}">
						<button type="submit" class="button">Unfavourite</button>
					</form:form>
				</c:if>
			</c:if>
			<c:if test="${favouriteRecipes == null}">
				<form:form action="/login-form">
						<button type="submit" class="button">Favourite</button>
				</form:form>
			</c:if>
		<a class="button" href="${pageContext.request.contextPath}/pdf/${recipe.name}.pdf" download>
		<p>Download</p>
		</a>
		</div>
		
		<div class="right_section">
			<h1 class="h1">${recipe.name}</h1>
			<p style="padding: 10px 0 10px 0;'">${recipe.description}</p>
			<p><b>Serving:</b> ${recipe.servings}</p>
			<p><b>Difficulty:</b> ${recipe.difficulty}</p>
			<p style="display:inline;"><b>Prep time:</b> ${recipe.prep_time}</p>
			<p style="display:inline"><b>Cooking time:</b> ${recipe.cooking_time}</p>
			<table style="padding-top:15px; margin: 0px">
				<tbody class="macros_table_body">
					<tr class="macros_table_row">
						<td class="macros_table_nutrient">cal</td>
						<td style="padding:5px;">${recipe.calories}</td>
					</tr>
					<tr class="macros_table_row">
						<td class="macros_table_nutrient">fat</td>
						<td style="padding:5px;">${recipe.fat}g</td>
					</tr>
					<tr class="macros_table_row">
						<td class="macros_table_nutrient">saturates</td>
						<td style="padding:5px;">${recipe.saturates}g</td>
					</tr>
					<tr class="macros_table_row">
						<td class="macros_table_nutrient">sugars</td>
						<td style="padding:5px;">${recipe.sugars}g</td>
					</tr>
					<tr class="macros_table_row">
						<td class="macros_table_nutrient">salt</td>
						<td style="padding:5px;">${recipe.salt}g</td>
					</tr>
					<tr class="macros_table_row">
						<td class="macros_table_nutrient">protein</td>
						<td style="padding:5px;">${recipe.protein}g</td>
					</tr>
					<tr class="macros_table_row">
						<td class="macros_table_nutrient">carbs</td>
						<td style="padding:5px;">${recipe.carbs}g</td>
					</tr>
					<tr class="macros_table_row">
						<td class="macros_table_nutrient">fibre</td>
						<td style="padding:5px;">${recipe.fibre}g</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	
	<hr class="line_break">
	
	
	<!-- Ingredients and Method section -->
	
	
	 <div class="bottom_section">
     	<div class="left_section">
     	
     		<h2>Ingredients</h2>
	     	<ul>
				<c:forEach items="${recipe.ingredients}" var="ingredient">
					<li class="ingredient_list_item">${ingredient}</li>
				</c:forEach>
			</ul>
     	
     	</div>
     	<div class="right_section">
     	
     		<h2>Method</h2>
			<ol>
				<c:forEach items="${recipe.method}" var="step">
					<li style="padding:10px 0px 10px 0px;">${step}</li>
				</c:forEach>
			</ol>
     	
     	</div>
	</div>
</div>
	
</body>
</html>

