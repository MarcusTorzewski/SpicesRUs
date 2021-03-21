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
		<li><a href="/about">About Us</a></li>
		<li><a href="/spices">Spices</a></li>
		<li><a href="/recipes">Recipes</a></li>
		<li><a href="/favourites">Favourites</a></li>
		<li><a href="#">Discussion Forum</a></li>
		<li><a href="/account" style="text-decoration: underline rgb(68, 68, 68);">My Account</a>
		<li><a href="/logout">Sign Out</a></li>
		<li><a href="#">Basket</a></li>
    </ul>


    <div class="text_main1">

        <table>
        	<tr>
		       	<td>Name</td>
		       	<td>${user.firstName} ${user.lastname }</td>
        	</tr>
        	<tr>
        		<td>Email</td>
        		<td>${user.email }</td>
        	</tr>
        	<tr>
        		<td>Account</td>
        		<td>
        		<c:forEach items="${user.roles}" var="role">
        		${role.id }  
        		</c:forEach>
        		</td>
       		</tr>
        </table>
	<a href="/editAccount" >Edit account details</a>
    </div>

    <div class="text_main2">
      <h1>
        <p>
          
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
