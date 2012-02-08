<%@page import="com.googlecode.objectify.Key"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.asingleplace.mailer.Utilities"%>
<%@ page import="com.asingleplace.mailer.model.RequestParser"%>
<%@ page import="com.asingleplace.mailer.model.UnitType"%>
<%@ page import="com.asingleplace.mailer.model.Unit"%>
<jsp:useBean id="dao" class="com.asingleplace.mailer.dao.MyDAO" />
<%
	
%>
<html>
<head>
<title>Manage Tags</title>
</head>
<body>
	<h1>Tags</h1>
	<ul>
		<li><a href="?id=">Add New</a>
		</li>
	</ul>

	<div class="alert alert-error">Sorry, this page isn't built
		yet.</div>
</body>
</html>
