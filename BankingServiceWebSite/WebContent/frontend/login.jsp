<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style type="text/css">
input.specific {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	opacity: 0.9;
}

input.specific:hover {
	opacity: 1;
}
</style>
</head>
<body>
		<div align="center">
				<h2>Vui lòng đăng nhập:</h2>
				<form name="dangnhap" action="doLogin.jsp" method="post">
		        <table border="0">
		            <tr>
		                <td>Tên TK:</td>
		                <td><input onchange="usernameOnChange(this.value)" style="width: 200px" name="username" id="username" required /> <a style="color: red;">(*)</a></td>
		            </tr>
		            <tr>
		                <td>Mật khẩu:</td>
		                <td><input onchange="passwordOnchange(this.value)" style="width: 200px" type="password" name="password" id="password" required /> <a style="color: red;">(*)</a></td>
		            </tr>
		            
		            <tr>
		                <td></td>
		                <td><input id="dologin" type="submit" value="Đăng nhập" disabled="true" class="specific"/>
		                <input type="button" onclick="backToHome()"  id="backtohome" value="Huỷ bỏ" class="specific"/>
		                </td>
		            </tr>
		        </table>
		    </form>
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	var usernameInput = document.getElementById("username");
	var passwordInput = document.getElementById("password");
	var loginButton = document.getElementById("dologin");
	var cancelButton = document.getElementById("backtohome");
	function usernameOnChange(inputvalue){
		if(inputvalue !="" && passwordInput.value !=""){
			loginButton.disabled = false;
		}
	}
	function passwordOnchange(inputvalue){
		if(inputvalue !="" && usernameInput.value !=""){
			loginButton.disabled = false;
		}
	}
	function backToHome(){
		window.location.href("../");
	}
</script>
</html>