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
		<li><a href="/account" style="text-decoration: underline rgb(68, 68, 68);">My Account</a>
	    <li><a href="/logout">Sign Out</a>
	    <li><a href="/basket">Basket</a></li>
    </ul>

    <div class="account">
    	<p style="color:red">${errorInfo }</p>
		<form:form action="/editData" method="post" commandName="editUserDetails"> 
		<table border="0">
                <tr>
                    <td colspan="2" align="center"><h2>Change Account Details</h2></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><p>Enter only the details you want to change</p></td>
                </tr>
                <tr>
				   <td>New Email: </td> <td> <input type="email" name="email" /></td>
				   </tr>
				<tr>
				   <td>New Password: </td><td><input type="password" name="password"/></td>
				</tr>
				<tr>
				   <td>Re-enter New Password: </td><td><input type="password" name="passwordCheck"/></td>
				</tr>
				<tr>
				   <td>New First Name: </td><td><input type="text" name="firstName" /></td>
				</tr>
				<tr>
				   <td>New Last Name: </td><td><input type="text" name="lastName" /></td>
				</tr>
				<tr>
				   
				</tr>
			</table>
			Premium (£3.99/month): <input type="checkbox" name="premium"/><label for="premium"></label>
			<br/>
		   <input type="submit" value="Change Details" /><br/> 
		</form:form>
    </div>
  </body>
</html>