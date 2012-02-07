<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.asingleplace.mailer.dao.MyDAO"%>
<%@ page import="com.asingleplace.mailer.model.User"%>
<%
	MyDAO dao = new MyDAO();
	User user = dao.postUser(request.getParameter("email"));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>A Single Place - Mailer</title>
</head>
<body>
	<%@include file="includes/header.html"%>
	
	<%
	if (!user.isEmailConfirmed()) {
		%><div class="alert">You have not confirmed your email address yet.
		</div><%
	}
	%>

	<form action="subscribe.jsp" method="post">
		<table>
			<tr>
				<td>Email:</td>
				<td><%= user.getEmail() %></td>
			</tr>
			<tr>
				<td>First name:</td>
				<td><input name="user.firstName" value="<%= user.getFirstName() %>" ></td>
			</tr>
			<tr>
				<td></td>
				<td><button name="button" value="save">Save</button></td>
			</tr>
		</table>
	</form>

	<%@include file="includes/footer.html"%>
</body>
</html>
