package com.asingleplace.mailer.model;

import javax.servlet.http.HttpServletRequest;

import com.googlecode.objectify.Key;

public class RequestParser {

	private HttpServletRequest request;

	public RequestParser(HttpServletRequest request) {
		this.request = request;
	}

	public void fillUser(User user) {
		user.setFirstName(getString("firstName"));
		user.setLastName(getString("lastName"));
		user.setMale(getBoolean("male"));
		user.setMaxDistance(getInteger("maxDistance"));
		user.setLds(getBoolean("lds"));
		if (user.isLds()) {
			Long unitID = getLong("ward");
			if (unitID == null)
				unitID = getLong("stake");
			if (unitID != null && unitID > 0) {
				user.setUnit(new Key<Unit>(Unit.class, unitID));
			}
		} else {
			user.setUnit(null);
		}
	}

	public void fillUnit(Unit unit) {
		unit.setName(getString("name"));
		String type = getString("type");
		if (type != null)
			unit.setType(UnitType.valueOf(type));
	}

	private Integer getInteger(String name) {
		String value = request.getParameter(name);
		if (value == null)
			return null;
		if (value.isEmpty())
			return null;

		return Integer.parseInt(value);
	}

	private Long getLong(String name) {
		String value = request.getParameter(name);
		if (value == null)
			return null;
		if (value.isEmpty())
			return null;

		return Long.parseLong(value);
	}

	private Boolean getBoolean(String name) {
		String value = request.getParameter(name);
		if (value == null)
			return null;

		if (value.equals("true"))
			return true;
		if (value.equals("false"))
			return false;
		return null;
	}

	private String getString(String name) {
		String parameter = request.getParameter(name);
		if (parameter == null)
			return null;

		// String[] requestArray = (String[]) obj;
		// String value = requestArray[0];
		if (parameter.equals("null"))
			return null;
		return parameter;
	}

	public String getBaseURL() {
		String url = request.getRequestURL().toString();
		int indexOfUri = url.indexOf(request.getRequestURI());
		return url.substring(0, indexOfUri);
	}

}
