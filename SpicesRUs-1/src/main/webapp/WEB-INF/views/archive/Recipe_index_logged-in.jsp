<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Spices R Us</title>
    <link rel="stylesheet" href="/resources/css/style.css"> 
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400&display=swap"
      rel="stylesheet"
    />
   	<link rel="stylesheet" href="/resources/css/gridLayout.css">
  </head>
  <body>
    <ul class="nav">
      <div id="logo">
        <a href="/"> <img height="70px" src="${pageContext.request.contextPath}/images/SpicesRUs_logo.png" /> </a>
      </div>
      <li><a href="/about">About Us</a></li>
      <li><a href="/spices">Spices</a></li>
      <li><a href="/recipes" style="text-decoration: underline rgb(68, 68, 68);">Recipes</a></li>
      <li><a href="/favourites">Favourites</a></li>
      <li><a href="#">Discussion Forum</a></li>
      <li><a href="#">Sign-out</a></li>
      <li><a href="/basket">Basket</a></li>
    </ul>

    <div class="banner">
      <img class="banner-image" src="${pageContext.request.contextPath}/images/spices_background.jpg" />
    </div>
    
    <!-- Recipes -->
    
    <div class="gridSection">
		<h1 class="h1">Check Out Our Recipes</h1>
		<div class="grid-container">
			<c:forEach items="${recipes}" var="recipe">
				<a href="recipes/${recipe.name}" style="text-decoration: none; color:black;">
					<div class="grid-item" style="height:270px">
					<img style="width:206px;height:200px;object-fit:cover;" src="${recipe.image}"/>
					${recipe.name}
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
       
  </body>
</html>
