<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style type="text/css">
.hidden {
  visibility: hidden;
  border: 1px solid white;
}
.visible {
  border: 1px solid white;
  visibility: visible;
  color: red;
}
</style>
<body>
<% String error = (String) request.getAttribute("error"); %> 
<div align="center">
<form id="loginForm">
<table> 
<tr><td>User ID:</td><td><input type="Text" id="userId" name="userId" value="Ali" ></td></tr>
<tr><td></td><td><input type="text" id="userIdV" class="hidden"  value="Mandatory field" ></td></tr>
<tr><td>Password:</td><td><input type="password"  id="password" name="password" value="Abc123" ></td></tr>
<tr><td></td><td><input type="text" id="passwordV" class="hidden" value="Mandatory field" ></td></tr>
<tr><td></td><td><input type="button" id="login" value="Login" ></td></tr>
<% if(error != null || "error".equalsIgnoreCase(error)) { %>
    <tr><td></td><td><input type="text" id="validate" class="visible" value="User Id or password Wrong" ></td></tr>
<% } %>
</table>
</form>
</div>
</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
    	$("#login").click(function(event){
    		var userId = $('#userId').val();
    		var password = $('#password').val();
    		var loginValid = true;
    		$('#validate').addClass('hidden').removeClass('visible');
    		
     		if (userId == "" && password == "") {
    			$('#userIdV').addClass('visible').removeClass('hidden');
    			$('#passwordV').addClass('visible').removeClass('hidden');
    			loginValid = false;
    		} else if (userId == "" && !password == "") {
    			$('#userIdV').addClass('visible').removeClass('hidden');
    			$('#passwordV').addClass('hidden').removeClass('visible');
    			loginValid = false;
    		} else if (password == "" && !userId == "") {
    			$('#passwordV').addClass('visible').removeClass('hidden');
    			$('#userIdV').addClass('hidden').removeClass('visible');
    			loginValid = false;
    		}
     		
     		if(loginValid) {
     			document.getElementById("loginForm").action = "JavaTest";
     			document.getElementById("loginForm").method = "POST";
     			document.getElementById("loginForm").submit();
     		}
     		
    	})
    })
</script>
</html>