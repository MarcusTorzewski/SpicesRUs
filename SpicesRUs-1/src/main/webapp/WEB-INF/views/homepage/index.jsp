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
      rel="stylesheet"
    />
  </head>
  <body>
    <ul class="nav">
      <div id="logo">
        <a href="#"> <img height="70px" src="${pageContext.request.contextPath}/images/SpicesRUs_logo.png" /> </a>
      </div>
      <li><a href="/about">About Us</a></li>
      <li><a href="/spices">Spices</a></li>
      <li><a href="/recipes">Recipes</a></li>
      <li><a href="#">Discussion Forum</a></li>
      <sec:authorize access="isAuthenticated()">
      	<li><a href="/account">My Account</a>
    	<li><a href="/logout">Sign Out</a>
    	</sec:authorize>
	  <sec:authorize access="!isAuthenticated()">
      <li><a href="/login-form">Sign-in</a></li>
      </sec:authorize>
      <li><a href="#">Basket</a></li>
    </ul>

    <div class="banner">
      <img class="banner-image" src="${pageContext.request.contextPath}/images/spices_background.jpg" />
    </div>
    <div class="text_main1">
      <h1>
        <p>
          We believe in connecting the world with the power of taste. That is
          why we offer the finest spices at accessible prices.<br />
          <br /><br />
          We also believe in providing high quality recipes, in order for you to
          gain the most out of our highest quality ingredients.
        </p>
      </h1>
    </div>
    <div class="banner">
      <img class="banner-image2" src="${pageContext.request.contextPath}/images/food_table.jpg" />
    </div>
    <div class="text_main2">
      <h1>
        <p>
          Our high quality spices are sourced responsibly. We follow 3 simple
          rules:
          <br />
          <br /><br />
        </p>
        <ul>
          <li>Be mindful of the environment.</li>
          <li>Ensure sustainability.</li>
          <li>Look after the local community.</li>
        </ul>
      </h1>
    </div>
  </body>
</html>
