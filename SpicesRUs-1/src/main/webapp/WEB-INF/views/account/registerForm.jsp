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
      <li><a href="/login-form">Sign-in</a></li>
      <li><a href="/basket">Basket</a></li>
    </ul>

    <div class="account" >
    	<p style="color:red">${errorInfo }</p>
		<form:form action="/accountBuild" method="post" commandName="userRegister"> 
		<table border="0">
                <tr>
                    <td colspan="2"><h2>Registration</h2></td>
                </tr>
                <tr>
				   <td>Email: </td> <td> <input type="email" name="email" /></td>
				   </tr>
				<tr>
				   <td>Password: </td><td><input type="password" name="password"/></td>
				</tr>
				<tr>
				   <td>Re-enter Password: </td><td><input type="password" name="passwordCheck"/></td>
				</tr>
				<tr>
				   <td>First Name: </td><td><input type="text" name="firstName" /></td>
				</tr>
				<tr>
				   <td>Last Name: </td><td><input type="text" name="lastName" /></td>
				</tr>
				<tr>
				</tr>
			</table>
			Premium (�3.99/month):<input type="checkbox" name="premium"/><label for="premium"></label><br/>
		   <input type="submit" value="Create Account!" /><br/>
		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form:form>
    </div>
    <br/>
	<div align="center">
		<a href="/login-form" id="backout">Back to Login</a>
    </div>
    <div id="loginbenefits">
    <h2>Become a Member for Free Today!</h2>
    <p>And gain access to:</p>
    <ul>
    	<li><p>The ability to favourite spices & recipes</p></li>
    	<li><p>Seamless checkout</p></li>
    </ul>
    <h2>Join Premium!</h2>
    <p>And on top of all that, gain access to :</p>
    <ul>
    	<li><p>Premium-only deals</p></li>
    	<li><p>Downloadable Recipe PDFs</p></li>
    	<li><p>Ability to switch between measurement units</p></li>
    </ul>
    </div>
  </body>
</html>