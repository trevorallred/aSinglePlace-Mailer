<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>A Single Place - Mailer</title>
</head>
<body>
<%@include file="includes/header.html"%>

	<form action="subscribe.jsp" method="post">
		<table>
			<tr>
				<td>Email:</td>
				<td><input name="email"></td>
			</tr>
			<tr>
				<td></td>
				<td><button name="button" value="login">Go</button></td>
			</tr>
		</table>
	</form>

<%@include file="includes/footer.html"%>
</body>
</html>
