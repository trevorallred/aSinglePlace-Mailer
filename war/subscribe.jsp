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
	String button = request.getParameter("button");
	User user = dao.postUser(request.getParameter("email"));
	if ("save".equals(button)) {
		requestParser.fillUser(user);
		dao.putUser(user);
	}
	
	Unit currentUnit = null;
	Unit parentUnit = null;
	if (user.getUnit() != null) {
		currentUnit = dao.getUnit(user.getUnit().getId());
		if (currentUnit.getParent() != null) {
			parentUnit = dao.getUnit(currentUnit.getParent().getId());
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
	%><div class="alert">You have not confirmed your email address
		yet. <a href="#resend">Click to Resend a confirmation email</a></div>
	<%
		}
	%>

	<form method="post">
		<input type="hidden" name="email" value="<%=user.getEmail()%>">
		<table>
			<tr>
				<td>Email:</td>
				<td><%=user.getEmail()%></td>
			</tr>
			<tr>
				<td>First name:</td>
				<td><input name="firstName" value="<%=user.getFirstName()%>">
				</td>
			</tr>
			<tr>
				<td>Last name:</td>
				<td><input name="lastName" value="<%=user.getLastName()%>">
				</td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><input id="genderMale" type="radio" name="male"
					value="true" <%=user.isMale() != null && user.isMale() ? "checked" : ""%>> <label
					for="genderMale">Male</label> <input id="genderFemale" type="radio"
					name="male" value="false" <%=user.isMale() != null && !user.isMale() ? "checked" : ""%>>
					<label for="genderFemale">Female</label>
				</td>
			</tr>
			<tr>
				<td
					title="Are you a member of the Church of Jesus Christ of Latter-day Saints?">LDS:</td>
				<td><input class="isLDS" id="ldsYes" type="radio" name="lds" value="true"
					<%=user.isLds() != null && user.isLds() ? "checked" : ""%>> <label for="ldsYes">Yes</label>
					<input class="isLDS" id="ldsNo" type="radio" name="lds" value="false"
					<%=user.isLds() != null && !user.isLds() ? "checked" : ""%>> <label for="ldsNo">No</label>
				</td>
			</tr>
			<tr>
				<td>Current Address:</td>
				<td>location</td>
			</tr>
			<tr>
				<td>Max Travel Distance:</td>
				<td><select name="maxDistance">
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
				</td>
			</tr>
			<tr class="lds">
				<td>LDS Stake:</td>
				<td><select name="stake">
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
					</select>
					<br /><a href="manage_units.jsp">Manage</a></td>
			</tr>
			<tr class="lds">
				<td>LDS Ward or Branch:</td>
				<td><input type="text" name="ward" id="ward"></td>
			</tr>
			<tr>
				<td>Preferences:</td>
				<td>tags</td>
			</tr>
			<tr>
				<td></td>
				<td><button name="button" value="save">Save</button>
				</td>
			</tr>
		</table>
	</form>
	
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
