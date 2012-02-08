<%@page import="com.asingleplace.mailer.Mailer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.asingleplace.mailer.model.User"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.asingleplace.mailer.Utilities"%>
<%@ page import="com.asingleplace.mailer.model.RequestParser"%>
<%@ page import="com.asingleplace.mailer.model.UnitType"%>
<%@ page import="com.asingleplace.mailer.model.Unit"%>
<jsp:useBean id="dao" class="com.asingleplace.mailer.dao.MyDAO" />
<%
	RequestParser requestParser = new RequestParser(request);
	User user = dao.getUser(request.getParameter("email"));
	String button = request.getParameter("button");
	if ("delete".equals(button)) {
		dao.removeUser(user.getEmail());
		response.sendRedirect(requestParser.getBaseURL());
	}
	if ("save".equals(button)) {
		requestParser.fillUser(user);
		dao.putUser(user);
	}
	
	Unit currentUnit = null;
	Unit parentUnit = null;

	if (user != null) {
		if (user.getUnit() != null) {
			currentUnit = dao.getUnit(user.getUnit().getId());
			if (currentUnit.getParent() != null) {
				parentUnit = dao.getUnit(currentUnit.getParent().getId());
			}
		}
	}
	
	Collection<Unit> stakes = dao.getAllStakesAndMissions();
%>
<html>
<head>
<title>Profile</title>
</head>
<body>
	<%
		if (!user.isEmailConfirmed()) {
			Mailer.sendMail(user,"Test from 'A Single Place'", "...this is a test");
	%><div class="alert">
		You have not confirmed your email address yet. <a href="#resend">Click
			to Resend a confirmation email</a>
	</div>
	<%
		}
	%>

	<fieldset>
		<legend>
			Edit Profile for
			<%=user.getEmail()%></legend>
		<form method="post" class="form-horizontal">
			<input type="hidden" name="email" value="<%=user.getEmail()%>">
			<div class="control-group">
				<label>First name</label>
				<div class="controls">
					<input name="firstName" value="<%=user.getFirstName()%>">
				</div>
			</div>
			<div class="control-group">
				<label>Last name</label>
				<div class="controls">
					<input name="lastName" value="<%=user.getLastName()%>">
				</div>
			</div>
			<div class="control-group">
				<label>Gender</label>
				<div class="controls" class="radio">
					<label class="radio inline"> <input id="genderMale"
						type="radio" name="male" value="true"
						<%=user.isMale() != null && user.isMale() ? "checked" : ""%>>
						Male</label> <label class="radio inline"> <input id="genderFemale"
						type="radio" name="male" value="false"
						<%=user.isMale() != null && !user.isMale() ? "checked" : ""%>>
						Female</label>
				</div>
			</div>
			<div class="control-group">
				<label>LDS</label>
				<div class="controls">
					<label for="ldsYes" class="radio inline"> <input
						class="isLDS" id="ldsYes" type="radio" name="lds" value="true"
						<%=user.isLds() != null && user.isLds() ? "checked" : ""%>>
						Yes</label> <label for="ldsNo" class="radio inline"> <input
						class="isLDS" id="ldsNo" type="radio" name="lds" value="false"
						<%=user.isLds() != null && !user.isLds() ? "checked" : ""%>>
						No</label>
					<p class="help-block">Are you a member of <a href="http://www.lds.org/" target="_BLANK">The Church of Jesus
						Christ of Latter-day Saints</a>?</p>
				</div>
			</div>
			<div class="control-group">
				<label>Current Address</label>
				<div class="controls">
				</div>
			</div>
			<div class="control-group">
				<label>Max Travel Distance</label>
				<div class="controls">
					<select name="maxDistance">
						<%
						int[] possibleMiles = {5,10,25,50,100,250,500};
						for(int mile : possibleMiles) {
							out.print("<option value=");
							out.print(mile);
							if ((user.getMaxDistance() == null && mile == 50) || (user.getMaxDistance() != null && user.getMaxDistance() == mile)) {
								out.print(" selected");
							}
							out.print(">");
							out.print(mile);
							out.print(" miles</option>");
						}
						%>
					</select>
				</div>
			</div>
			<div class="control-group lds">
				<label>LDS Stake</label>
				<div class="controls">
					<select name="stake">
						<option value="">- Please Select -</option>
						<%
					for(Unit stake : stakes) {
						boolean selected = false;
						if (currentUnit != null && stake.getId() == currentUnit.getId()) {
							selected = true;
						} else if (parentUnit != null && stake.getId() == parentUnit.getId()) {
							selected = true;
						}
						out.print("<option value='" + stake.getId() + "'" + (selected ? " SELECTED" : "") + ">" + stake.getName() + "</option>");
					}
				%>
					</select> <a href="manage_units.jsp">Manage</a>
				</div>
			</div>
			<div class="control-group lds">
				<label>LDS Ward or Branch</label>
				<div class="controls">
					<input type="text" name="ward" id="ward">
				</div>
			</div>
			<div class="control-group">
				<label>Preferences</label>
				<div class="controls"></div>
			</div>
			<div class="form-actions">
				<button name="button" value="save" class="btn btn-primary">Save</button>
				<button name="button" value="delete" class="btn btn-danger" onclick="return confirm('Are you sure you want to remove your profile? This cannot be undone.');">Delete</button>
			</div>
		</form>
	</fieldset>

	<a href="?email=<%=user.getEmail()%>">Refresh</a>

	<script type="text/javascript">
		function setLdsFields() {
			if ($("#ldsNo").is(':checked')) {
				$("tr.lds").hide();
			} else {
				$("tr.lds").show();
			}
		}
		setLdsFields();
		$("#ldsYes").click(setLdsFields);
		$("#ldsNo").click(setLdsFields);
	</script>
</body>
</html>
