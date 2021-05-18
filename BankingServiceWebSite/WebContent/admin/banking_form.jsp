<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create new form</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div align="center">
		<h2>Create new form</h2>
	</div>
	<div align="center">
		<form action="create_form" method="post">
		<table>
			<tr>
				<td align="right">Email:</td>
				<td align="left"><input type="text" name="email" size="20"/></td>
			</tr>
			<tr>
				<td align="right">Full name:</td>
				<td align="left"><input type="text" name="fullname" size="20"/></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" name="password" size="20"/></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="Save">
					<input type="button" value="Cancel">
				</td>
			</tr>
		</table>	
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>