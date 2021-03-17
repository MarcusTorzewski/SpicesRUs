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
  </head>
  <body>
    <ul class="nav">
      <div id="logo">
        <a href="/"> <img height="70px" src="${pageContext.request.contextPath}/images/SpicesRUs_logo.png" /> </a>
      </div>
      <li><a href="#" style="text-decoration: underline rgb(68, 68, 68);">About Us</a></li>
      <li><a href="/spices">Spices</a></li>
      <li><a href="/recipes">Recipes</a></li>
      <li><a href="/favourites">Favourites</a></li>
      <li><a href="#">Discussion Forum</a></li>
      <li><a href="#">Sign-in</a></li>
      <li><a href="#">Basket</a></li>
    </ul>

    <div class="banner">
      <img class="banner-image" src="${pageContext.request.contextPath}/images/spices_background.jpg" />
    </div>
    <div class="text_main1">
      <h1>
        <p>
          *Insert back story here*
        </p>
      </h1>
    </div>
    <div class="banner">
      <img class="banner-image2" src="${pageContext.request.contextPath}/images/food_table.jpg" />
    </div>
    <div class="text_main2">
      <h1>
        <p>
*Insert facts about business here*
          <br />
          <br /><br />
        </p>
        
      </h1>
    </div>
  </body>
</html>
