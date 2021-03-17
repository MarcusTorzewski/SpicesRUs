<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Spices R Us</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/spice_page.css">
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
			<li><a href="/spices"
				style="text-decoration: underline rgb(68, 68, 68);">Spices</a></li>
			<li><a href="/recipes">Recipes</a></li>
			<li><a href="#">Discussion Forum</a></li>
			<li><a href="#">Sign-in</a></li>
			<li><a href="#">Basket</a></li>
		</ul>

		<div class="banner">
			<img class="banner-image"
				src="${pageContext.request.contextPath}/images/spices_background.jpg" />
		</div>

		<div class="top_section">
			<div class="left_section">
				<img style="width: 350px; height: 350px; object-fit: cover;"
					src="${spice.image}">
			</div>
			<div class="right_section">
				<h1 class="spice_heading">${spice.name}</h1>
				<p>${spice.description}</p>
				<p style="padding: 10px 0 10px 0;'">${spice.name} originated in
					${spice.region}. ${spice.description}</p>
				<p>${spice.name} pairs well with:</p>
				<ul>
					<c:forEach items="${spice.compliment_spices}" var="compliment">
						<li class="compliment_list_item"><a
							href="/spices/${compliment}">${compliment}</a></li>
					</c:forEach>
				</ul>

				<div class="basket">
					<form action="../basket/add" method="POST">
						<!-- set action to add to basket in basket controller. -->
						<label for="quantity">Quantity: </label> <input type="number"
							id="quantity" name="quantity" value=1> <label for="size">Size:
						</label> <select id="size" name="size">
							<option selected value="small">small</option>
							<option value="medium">medium</option>
							<option value="large">large</option>
						</select> <input type="submit" value="Add To Basket">
					</form>
				</div>
			</div>
		</div>

	</div>

</body>
</html>
