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
      <li><a href="/login-form" style="text-decoration: underline rgb(68, 68, 68);">Sign-in</a></li>
      <li><a href="/basket">Basket</a></li>
    </ul>

    <div class="account">
    	<p style="color:red">${errorInfo }</p>
		<form:form action="/perform_login" method="post" commandName="userLogin"> 
		<table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Sign-In</h2></td>
            </tr>
            <tr>
				 <td>Email: </td><td><input type="email" name="email" /></td>
			<tr> 
				 <td>Password: </td><td><input type="password" name="password" /></td>
			</tr>
		</table> 
		   <input type="submit" value="Sign In" /><br/> 
		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="login"/>
		</form:form>
		<form:form action="/perform_login" method="post" commandName="userLogin"> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="Continue as Guest" id="guest"/><br/> 
			<table border="0">
	            <tr>
					 <td><input type="hidden" name="email" value="guest@guest.com"/></td>
				<tr> 
					 <td><input type="hidden" name="password" value="password"/></td>
				</tr>
			</table> 

		</form:form>
	</div>
	<br/>
	<div align="center">
		<a href="/createAccount" id="create">Become a Member for Free!</a>
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
