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
		<img class="banner-image"
			src="${pageContext.request.contextPath}/images/chilli_picture.jpg"
			style="width: 112%; height: auto;" />
	</div>

	<div class="gridSection">
		<h1 class="h1">Check Out Our Spices</h1>

		<div class="filtering" id="filtering">
			<input type="text" placeholder="Search for spices..." id="searchbar"
				onkeyup="searchFunction()">


			<button class="show_all">Clear</button>

			<c:forEach items="${spices}" var="spice">
				<script>
					if (!document.getElementById("${spice.region}")) {
						var button = document.createElement('BUTTON');
						button.innerHTML = "${spice.region}";
						button.className = "region_filter";
						button.id = "${spice.region}";
						document.getElementById("filtering")
								.appendChild(button);
					}
				</script>
			</c:forEach>

			<button class="sort_a-z">A-Z</button>
			<button class="sort_z-a">Z-A</button>
		</div>

		<div class="grid-container">
			<c:forEach items="${spices}" var="spice">
				<div class="grid-item" id="${spice.region}">
					<a href="spices/${spice.name}"
						style="text-decoration: none; color: black;"><img
						style="width: 206px; height: 200px; object-fit: cover;"
						src="${spice.image}"> ${spice.name} </a>
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

			$('.search').click(function() {
				$('.grid-item').show();
			});

			$('.show_all').click(function() {
				$('.grid-item').show();
			});

			$('.region_filter').click(function() {
				const value = $(this).attr('id');
				$('.grid-item').not('#' + value).hide();
				$('.grid-item').filter('#' + value).show();
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
				var sortByAZ = $divs.sort(function(a, b) {
					return $(a).find("a").text() < $(b).find("a").text();
				});
				$(".grid-container").html(sortByAZ);
			});
		});
	</script>
</body>
</html>


