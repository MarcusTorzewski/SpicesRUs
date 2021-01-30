<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/resources/css/style.css"> 
    <script type="text/javascript" src="/resources/js/parallax.js-1.5.0/parallax.min.js"></script>
    <title>Spices R Us</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400&display=swap"
      rel="stylesheet"
    />
  </head>

  <body id="overviewPage">
    <ul class="nav">
      <div id="logo">
        <a href="/"
          >
          
          <img height="70px" src="${pageContext.request.contextPath}/images/SpicesRUs_logo.png"/>
          
         
        
        </a>
      </div>

      <li><a href="/about">About Us</a></li>
      <li><a href="/spices">Spices</a></li>
      <li><a href="#">Recipes</a></li>
      <li><a href="#">Discussion Forum</a></li>
      <li><a href="#">Sign-in</a></li>
      <li><a href="#">Basket</a></li>
    </ul>

    <div class="container_Header" style="background-image: url('/images/spices_background.jpg')">
      <div
        class="parallax-window2"
        data-parallax="scroll"
        data-z-index="0"
        data-image-src= "${pageContext.request.contextPath}/images/spices_background.jpg"
      >
        <h id="infoHeader" style="background-color: #780116">${spice}</h>
      </div>
    </div>

    <div class="container">
      <div class="textParagraphs">
        <p>
			Insert info for the given spice here
        </p>
      </div>

      <div
      style="background-image: url('/images/food_table.jpg')"
        class="parallax-window"
        data-parallax="scroll"
        data-z-index="0"
        data-image-src="${pageContext.request.contextPath}/images/food_table.jpg"
      >
        <p class="info"><br /><br /></p>
      </div>

      <div class="textParagraphs" style="text-align: left">
        <p>
          Insert more info for the given spice here
        </p>
      </div>
    </div>
  </body>
</html>
