package com.asingleplace.mailer.dao;

import com.asingleplace.mailer.model.Unit;
import com.asingleplace.mailer.model.User;
import com.googlecode.objectify.NotFoundException;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.util.DAOBase;

public class MyDAO extends DAOBase {
	private Objectify ofy;

	static {
		ObjectifyService.register(User.class);
		ObjectifyService.register(Unit.class);
	}

	public MyDAO() {
		ofy = ObjectifyService.begin();
	}
	
	public User postUser(String email) {
		try {
			return getUser(email);
		} catch (NotFoundException e) {
			return putUser(email);
		}
	}

	private User getUser(String email) {
		if (email == null || email.trim().isEmpty())
			return null;
		email = email.trim();
		
		return ofy.get(User.class, email);
	}

	private User putUser(String email) {
		User user = new User(email);
		ofy.put(user);
		return user;
	}
}
