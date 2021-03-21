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
        <a href="/"> <img height="70px" src="${pageContext.request.contextPath}/images/SpicesRUs_logo.png" /> </a>
      </div>
      <li><a href="#" style="text-decoration: underline rgb(68, 68, 68);">About Us</a></li>
      <li><a href="/spices">Spices</a></li>
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
      <img class="banner-image" src="${pageContext.request.contextPath}/images/spices_background.jpg" />
    </div>
    <div class="text_main1">
       <h1>Who we are</h1>
       <h1>Our Values</h1>
       <h1>Interesting facts</h1>
     <p>

          
         
          
     </p>
    </div>
    <div class="banner">
      <img class="banner-image2" src="${pageContext.request.contextPath}/images/food_table.jpg" />
    </div>
    <div class="text_main2">
    	<h2>Who we are </h2>
    	<p>
          We are your online source for the most common, exotic and hard to find spices 
          for cooking and baking. Experience yourself 
          with the spices all over the world, starting 
          from east Asia and ending in north America. It is great opportunity to spend 
          less time searching for expensive spices at your local grocery store when you can find everything here. 
          Whether you need just a little or more than a kilo, all of our products ship free worldwide ! </p>
        <h2>Our Values</h2>
        <p>
		We are most passionate about quality. All the products on the site are provided
		 from the oldest and most valuable sources of spices. We do everything 
		for our products to taste, smell better, last longer and remain as fresh as possible.</p>
      <h1>
        <p>
	Interesting facts 
	First product arrived at our warehouse was a cinnamon! 
	Our first recipe author is mother of an employee!
	The logo of the shop was inspired by the client.
          <br />
          <br /><br />
        </p>
        
      </h1>
    </div>
  </body>
</html>
