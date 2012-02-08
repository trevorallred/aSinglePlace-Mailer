<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="sitemesh-decorator" prefix="decorator"%>
<html lang="en">
<head>
<title>A Single Place - <decorator:title default="Mailer" />
</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

input {
	padding: 13px;
}
</style>
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<decorator:head />
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> </a> <a
					class="brand" href="../">A Single Place</a>
				<div class="nav-collapse">
					<ul class="nav">
						<li<%= request.getRequestURI().contains("subscribe") ? " class='active'" : "" %>><a href="subscribe.jsp">Profile</a></li>
						<li<%= request.getRequestURI().contains("manage_users") ? " class='active'" : "" %>><a href="manage_users.jsp">Users</a></li>
						<li<%= request.getRequestURI().contains("manage_units") ? " class='active'" : "" %>><a href="manage_units.jsp">Units</a></li>
						<li<%= request.getRequestURI().contains("manage_tags") ? " class='active'" : "" %>><a href="manage_tags.jsp">Tags</a>
						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<div class="container">
		<decorator:body />
		<footer> A Mailing List for <a
			href="http://www.asingleplace.com">aSinglePlace.com</a>
			
			<br><a href="../">Logout</a>
		</footer>
	</div>
</body>
</html>