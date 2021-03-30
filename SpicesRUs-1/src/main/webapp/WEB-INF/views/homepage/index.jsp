<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Spices R Us</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/home_page.css">
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
      <li><a href="/favourites">Favourites</a></li>
      <li><a href="#">Discussion Forum</a></li>
      <sec:authorize access="isAuthenticated()">
      	<li><a href="/account">My Account</a>
    	<li><a href="/logout">Sign Out</a>
    	</sec:authorize>
	  <sec:authorize access="!isAuthenticated()">
      <li><a href="#">Sign-in</a></li>
      </sec:authorize>
      <li><a href="/basket">Basket</a></li>
    </ul>

    <div class="banner">
      <img class="banner-image" src="${pageContext.request.contextPath}/images/spices_background.jpg" />
    </div>
    
    <div class="main_section">
    	<h1>Welcome to Spices R Us</h1>
    	<p>Welcome to Spices R Us! We are your online source for the most common, exotic and hard to find spices for cooking and baking.
    	Experience yourself with the spices all over the world, starting from east Asia and ending in north America. 
    	It is great opportunity to spend less time searching for expensive spices at your local grocery store when you can find everything here. 
    	Whether you need just a little or more than a kilo, all of our products ship free worldwide!</p>
    </div>
    
    <div class="img_section">
    	<h2>Gallery</h2>
    	<div class="pic_container">
	    	<img src="${pageContext.request.contextPath}/images/home_page_pic1.jpg" class="pic"/>
    	</div>
    	<div class="pic_container">
	    	<img src="${pageContext.request.contextPath}/images/home_page_pic2.jpg" class="pic"/>
    	</div>
    	<div class="pic_container">
	    	<img src="${pageContext.request.contextPath}/images/home_page_pic3.jpg" class="pic"/>
    	</div>
    	   <div class="pic_container">
	    	<img src="${pageContext.request.contextPath}/images/home_page_pic4.jpg" class="pic"/>
    	</div>
    </div>
    
    <div class="main_section">
    	<h2 style="padding-bottom:1%;">How to contact us</h2>
    	<p style="display:inline;margin-right:1%;margin-left:1%;">Email: SpiceRUs@outlook.com</p>
    	<p style="display:inline;margin-right:1%;margin-left:1%;">Phone number: 07111 111111</p>
    	<br/>
    	<br/>
    	<img src="${pageContext.request.contextPath}/images/twitter_logo.png" style="display:inline;height:25px;width:25px;position:relative;top:6px;right:5px;"><a href=# style="display:inline;margin-right:20px;">Follow us on Twitter</a>
    	<img src="${pageContext.request.contextPath}/images/instagram_logo.png" style="display:inline;height:25px;width:25px;position:relative;top:6px;right:5px;"><a href=# style="display:inline;margin-right:20px;">Follow us on Instagram</a>
    	<img src="${pageContext.request.contextPath}/images/facebook_logo.webp" style="display:inline;height:20px;width:25px;position:relative;top:4px;right:5px;"><a href=# style="display:inline;margin-right:20px;">Follow us on Facebook</a>
    </div>
      
   </body>