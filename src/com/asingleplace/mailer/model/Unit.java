package com.asingleplace.mailer.model;

import javax.persistence.Id;

import com.google.appengine.api.datastore.GeoPt;
import com.googlecode.objectify.Key;

public class Unit implements Comparable<Unit> {
	@Id
	private Long id;
	private String name = "";
	private UnitType type = UnitType.Ward;
	private Key<Unit> parent;
	// private Key<User>[] admins;
	private GeoPt location;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public UnitType getType() {
		return type;
	}

	public void setType(UnitType type) {
		this.type = type;
	}

	public Key<Unit> getParent() {
		return parent;
	}

	public void setParent(Key<Unit> parent) {
		this.parent = parent;
	}

	public GeoPt getLocation() {
		return location;
	}

	public void setLocation(GeoPt location) {
		this.location = location;
	}

	public int compareTo(Unit o) {
		return name.compareTo(o.name);
	}

}
