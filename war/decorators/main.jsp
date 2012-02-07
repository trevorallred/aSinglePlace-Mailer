<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="sitemesh-decorator" prefix="decorator"%>
<html>
<head>
<title>A Single Place - <decorator:title default="Mailer" /></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<decorator:head />
</head>
<body>
	<h1>
		Welcome to the Mailing List for <a href="http://www.asingleplace.com">aSinglePl@ce.com</a>
	</h1>

	<decorator:body />
	<hr>
	<div id="footer">
		Back to <a href="http://www.asingleplace.com">aSinglePlace.com</a> <a
			href="../">Logout</a>
	</div>
</body>
</html>