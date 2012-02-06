package com.asingleplace.mailer.model;

import javax.persistence.Id;

import com.googlecode.objectify.Key;

public class Unit {
	@Id
	private Long id;
	private String name;
	private UnitType type = UnitType.Ward;
	private Key<Unit> parent;
	// private Key<User>[] admins;
	private String location;
	private Integer latitude;
	private Integer longitude;

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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getLatitude() {
		return latitude;
	}

	public void setLatitude(Integer latitude) {
		this.latitude = latitude;
	}

	public Integer getLongitude() {
		return longitude;
	}

	public void setLongitude(Integer longitude) {
		this.longitude = longitude;
	}

}
