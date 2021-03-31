<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Spices R Us</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/account.css">
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
      <li><a href="/about">About Us</a></li>
      <li><a href="/spices">Spices</a></li>
      <li><a href="/recipes">Recipes</a></li>
	  <sec:authorize access="hasRole('MEMBER')">
	   		<li><a href="/account">My Account</a>
	 		<li><a href="/logout">Sign Out</a>
	</sec:authorize>
		<sec:authorize access="!hasRole('MEMBER')">
	      			<li><a href="/login-form">Sign-in</a></li>
		</sec:authorize>
    	<li><a href="/basket">Basket</a></li>
    </ul>

    <div class="account">
    	<h1>You don't have access to this page!</h1>
    	<p>You do not have the proper privileges to access this page.</p>
    	<p>Ensure you are logged into the right account and try again.</p>
    	<a href="/" id="create">Back to Safety</a>
    </div>
  </body>
</html>