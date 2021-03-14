<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   

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
      <li><a href="/about">About Us</a></li>
      <li><a href="/spices">Spices</a></li>
      <li><a href="/recipes">Recipes</a></li>
      <li><a href="#">Discussion Forum</a></li>
      <sec:authorize access="isAuthenticated()">
    	<li><a href="/logout">Sign Out</a>
    	</sec:authorize>
	  <sec:authorize access="!isAuthenticated()">
      <li><a href="/login-form">Sign-in</a></li>
      </sec:authorize>
      <li><a href="#">Basket</a></li>
    </ul>

    <div class="text_main1">
		<form:form action="/myLogin" method="post" commandName="userLogin"> 
		   Email: <input type="email" name="email" /><br/> 
		   Password: <input type="password" name="password" /><br/> 
		   <input type="submit" value="Sign In" /><br/> 
		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		   <a href="/createAccount">Create an account</a>
		</form:form>
    </div>
  </body>
</html>