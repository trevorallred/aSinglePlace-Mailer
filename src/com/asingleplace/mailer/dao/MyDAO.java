package com.asingleplace.mailer.dao;

import java.util.Collection;
import java.util.TreeSet;

import com.asingleplace.mailer.model.Unit;
import com.asingleplace.mailer.model.UnitType;
import com.asingleplace.mailer.model.User;
import com.googlecode.objectify.Key;
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
			return putUser(new User(email));
		}
	}

	public User getUser(String email) {
		if (email == null || email.trim().isEmpty())
			return null;
		email = email.trim();

		return ofy.get(User.class, email);
	}

	public User putUser(User user) {
		ofy.put(user);
		return user;
	}

	public void removeUser(String email) {
		ofy.delete(User.class, email);
	}

	public Unit getUnit(Long id) {
		if (id == null)
			return null;

		return ofy.get(Unit.class, id);
	}

	public void removeUnit(long id) {
		ofy.delete(Unit.class, id);
	}

	public Collection<Unit> getAllStakesAndMissions() {
		Collection<Unit> sortedUnits = new TreeSet<Unit>();

		{
			Iterable<Key<Unit>> allKeys = ofy.query(Unit.class).filter("type", UnitType.Stake).fetchKeys();
			sortedUnits.addAll(ofy.get(allKeys).values());
		}
		{
			Iterable<Key<Unit>> allKeys = ofy.query(Unit.class).filter("type", UnitType.Mission).fetchKeys();
			sortedUnits.addAll(ofy.get(allKeys).values());
		}

		return sortedUnits;
	}

	public void postUnit(Unit unit) {
		ofy.put(unit);
	}

}
