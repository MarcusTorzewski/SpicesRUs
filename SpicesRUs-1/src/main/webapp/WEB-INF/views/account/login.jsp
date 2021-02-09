<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<form action="/myLogin" method="post"> 
   Email: <input type="email" name="email" /><br/> 
   Password: <input type="password" name="password" /><br/> 
   <input type="submit" value="Sign In" /><br/> 
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form> 
</body>
</html>