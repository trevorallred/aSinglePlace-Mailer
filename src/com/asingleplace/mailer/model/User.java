package com.asingleplace.mailer.model;

import javax.persistence.Id;

import com.google.appengine.api.datastore.Category;
import com.google.appengine.api.datastore.GeoPt;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Unindexed;

@Unindexed
public class User {
	
	@Id
	private String email;
	private String firstName;
	private String lastName;
	private UserType type;
	private boolean emailConfirmed = false;
	// private Date birthDay;
	private Boolean gender;
	private boolean lds = true;
	private Key<Category>[] tags;
	private Key<Unit> unit;
	private GeoPt location;
	private Integer maxDistance;

	// private ReceiptPreference preference;

	public User() {
	}

	public User(String email) {
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public UserType getType() {
		return type;
	}

	public void setType(UserType type) {
		this.type = type;
	}

	public boolean isEmailConfirmed() {
		return emailConfirmed;
	}

	public void setEmailConfirmed(boolean emailConfirmed) {
		this.emailConfirmed = emailConfirmed;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public boolean isLds() {
		return lds;
	}

	public void setLds(boolean lds) {
		this.lds = lds;
	}

	public Key<Category>[] getTags() {
		return tags;
	}

	public void setTags(Key<Category>[] tags) {
		this.tags = tags;
	}

	public Key<Unit> getUnit() {
		return unit;
	}

	public void setUnit(Key<Unit> unit) {
		this.unit = unit;
	}

	public GeoPt getLocation() {
		return location;
	}

	public void setLocation(GeoPt location) {
		this.location = location;
	}

	public Integer getMaxDistance() {
		return maxDistance;
	}

	public void setMaxDistance(Integer maxDistance) {
		this.maxDistance = maxDistance;
	}

}
