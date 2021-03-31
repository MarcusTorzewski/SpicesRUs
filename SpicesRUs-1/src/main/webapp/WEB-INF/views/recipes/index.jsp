<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
<link rel="stylesheet" href="/resources/css/filtering.css">
</head>
<body>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
		
	</script>
	
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
		<img class="banner-image"
			src="${pageContext.request.contextPath}/images/recipe_image.jpg"
			style="top: -100%;" />
	</div>

	<div class="gridSection">
		<h1 class="h1">Check Out Our Recipes</h1>
	
		<div class="filtering_buttons" id="filtering_buttons">
			<input type="text" placeholder="Search for recipes..." id="searchbar"
				onkeyup="searchFunction()">
			
			<button class="show_all">Clear</button>
			
			<div class="other_buttons">
				<button class="sort_a-z">A-Z</button>
				<button class="sort_z-a">Z-A</button>
				<button class="sort_calories">Calories (L-H)</button>
				<button class="sort_time">Cooking Time (L-H)</button>
			</div>
			
			<div class="difficulty_buttons">
				Difficulty: 
				<button class="filter_difficulty" id="1">1</button>
				<button class="filter_difficulty" id="2">2</button>
				<button class="filter_difficulty" id="3">3</button>
				<button class="filter_difficulty" id="4">4</button>
				<button class="filter_difficulty" id="5">5</button>
			</div>
		</div>
		
		<div class="grid-container">
			<c:forEach items="${recipes}" var="recipe">
				<div class="grid-item" id="${recipe.difficulty}">
					<a href="recipes/${recipe.name}"
						style="text-decoration: none; color: black;"><img
						style="width: 206px; height: 200px; object-fit: cover;"
						src="${recipe.image}"> ${recipe.name} </a>
					<span class="calories" style="display:none">${recipe.calories}</span>
					<span class="time" style="display:none">${recipe.cooking_time}</span>
				</div>
				
			</c:forEach>
		</div>

	</div>
	<script>
		$(document).ready(function() {

			$("#searchbar").keyup(function() {
				var filter = $(this).val()
				var count = 0;

				$('.grid-item').each(function() {
					if ($(this).text().search(new RegExp(filter, "i")) < 0) {
						$(this).hide();
					} else {
						$(this).show();
					}
				});
			});

			$('.show_all').click(function() {
				$('.grid-item').show();
			});

			$('.sort_a-z').click(function() {
				var $divs = $("div.grid-item");
				var sortByAZ = $divs.sort(function(a, b) {
					return $(a).find("a").text() > $(b).find("a").text();
				});
				$(".grid-container").html(sortByAZ);
			});

			$('.sort_z-a').click(function() {
				var $divs = $("div.grid-item");
				var sortByZA = $divs.sort(function(a, b) {
					return $(a).find("a").text() < $(b).find("a").text();
				});
				$(".grid-container").html(sortByZA);
			});

			$('.sort_calories').click(function() {
				var $divs = $("div.grid-item");
				var sortByCalories = $divs.sort(function(a, b) {
					return $(a).find(".calories").text() > $(b).find(".calories").text();
				});
				$(".grid-container").html(sortByCalories);
			});

			$('.sort_time').click(function() {
				var $divs = $("div.grid-item");
				var sortByTime = $divs.sort(function(a, b) {
					return $(a).find(".time").text() > $(b).find(".time").text();
				});
				$(".grid-container").html(sortByTime);
			});

			$('.filter_difficulty').click(function() {
				const value = $(this).attr('id');
				$('.grid-item').not('#' + value).hide();
				$('.grid-item').filter('#' + value).show();
			});
			
		});
	</script>

</body>
</html>
