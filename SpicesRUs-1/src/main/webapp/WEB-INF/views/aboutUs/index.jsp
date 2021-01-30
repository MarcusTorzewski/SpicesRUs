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
        <h id="infoHeader" style="background-color: #780116">About Us</h>
      </div>
    </div>

    <div class="container">
      <div class="textParagraphs">
        <p>
          We believe in connecting the world with the power of taste. That is
          why we offer the finest spices at accessible prices.<br />
          <br /><br />
          We also believe in providing high quality recipes, in order for you to
          gain the most out of our highest quality ingredients.
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
          Our high quality spices are sourced responsibly. We follow 3 simple
          rules:
        </p>
        <ul class="a">
          <li>Be mindful of the environment.</li>
          <li>Ensure sustainability.</li>
          <li>Look after the local community.</li>
        </ul>
      </div>
    </div>
  </body>
</html>
