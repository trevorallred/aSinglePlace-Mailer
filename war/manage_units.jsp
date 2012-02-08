<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.googlecode.objectify.Key"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.asingleplace.mailer.Utilities"%>
<%@ page import="com.asingleplace.mailer.model.RequestParser"%>
<%@ page import="com.asingleplace.mailer.model.UnitType"%>
<%@ page import="com.asingleplace.mailer.model.Unit"%>
<jsp:useBean id="dao" class="com.asingleplace.mailer.dao.MyDAO" />
<%
	UserService userService = UserServiceFactory.getUserService();
	com.google.appengine.api.users.User user = userService.getCurrentUser();
	
	if (user == null) {
	    response.sendRedirect(userService.createLoginURL(request.getRequestURI()));
	}

	RequestParser requestParser = new RequestParser(request);
	String button = request.getParameter("button");
	Unit unit = new Unit();
	long id = Utilities.parseLong(request.getParameter("id"));
	if (id > 0) {
		unit = dao.getUnit(id);
		if ("delete".equals(button)) {
			dao.removeUnit(id);
			id = 0;
		}
	}
	if ("save".equals(button)) {
		requestParser.fillUnit(unit);
		dao.postUnit(unit);
	}
	long parentID = Utilities.parseLong(request.getParameter("parentID"));
	if (parentID > 0) {
		unit.setParent(new Key<Unit>(Unit.class, parentID));
	}
	
	Collection<Unit> stakes = dao.getAllStakesAndMissions();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Manage Units</title>
</head>
<body>
	<h1>Stakes and Missions</h1>
	<ul>
	<%
	for(Unit u : stakes) {
		out.print("<li><a href='?id=" + u.getId() + "'>" + u.getName() + "</a>");
	}
	%>
		<li><a href="?id=">Add New</a></li>
	</ul>

	<form method="post">
		<input type="hidden" name="id" value="<%=unit.getId()%>">
		<table>
		<% if (unit.getParent() != null) { %>
			<tr>
				<td>Within:</td>
				<td><%= dao.getUnit(unit.getParent().getId()).getName() %>
					<input type="hidden" name="parentID" value="<%=unit.getParent().getId()%>">
				</td>
			</tr>
		<% } %>
			<tr>
				<td>Name:</td>
				<td><input name="name" value="<%=unit.getName()%>"></td>
			</tr>
			<tr>
				<td>Type:</td>
				<td>
				<%
				if (unit.getId() == null) {
					%>
					<select name="type">
						<% for(UnitType type : UnitType.values()) {
							out.print("<option>" + type + "</option>");
						} %>
					</select>
					<%
				} else {
					out.print(unit.getType());
				}
				%>
				</td>
			</tr>
			<tr>
				<td>Location:</td>
				<td>location</td>
			</tr>
			<tr>
				<td></td>
				<td><button name="button" value="save">Save</button>
					<button name="button" value="delete">Delete</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
