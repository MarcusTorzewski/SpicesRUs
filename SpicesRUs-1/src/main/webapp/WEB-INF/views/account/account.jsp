<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
		<li><a href="/favourites">Favourites</a></li>
		<li><a href="/account" style="text-decoration: underline rgb(68, 68, 68);">My Account</a>
		<li><a href="/logout">Sign Out</a></li>
		<li><a href="/basket">Basket</a></li>
    </ul>

    <div class="account" align = center>
    <h2>Account Details</h2>
        <table id="accountData">
        	
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
        		<td style="font-style: italic;">
        		<c:forEach items="${user.roles}" var="role">
        		${role.id }  
        		</c:forEach>
        		</td>
       		</tr>
       		<tr>
       			
       		</tr>
        </table>
    </div>
    <div align = center>
        <br/>
        <a href="/editAccount" id="create">Edit account details</a>
    </div>
    <sec:authorize access="hasRole('ADMIN')">
    	<div class="account">
	   		<a href="/admin/sales" id="create">View sales</a>
	   	</div>
	</sec:authorize>
  </body>
</html>
