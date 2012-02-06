package com.asingleplace.mailer.model;

import java.util.Date;

import javax.persistence.Id;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Unindexed;

@Unindexed
public class User {
	@Id
	private String email;
	private String firstName;
	private String lastName;
	private UserType type;
	private Date emailConfirmed;
	// private Date birthDay;
	private Boolean gender;
	private boolean lds = true;
	private Key<Tag>[] tags;
	private Key<Unit> unit;
	private String location;
	private Integer latitude;
	private Integer longitude;
	private Integer maxDistance;

	// private ReceiptPreference preference;

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

	public Date getEmailConfirmed() {
		return emailConfirmed;
	}

	public void setEmailConfirmed(Date emailConfirmed) {
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

	public Key<Tag>[] getTags() {
		return tags;
	}

	public void setTags(Key<Tag>[] tags) {
		this.tags = tags;
	}

	public Key<Unit> getUnit() {
		return unit;
	}

	public void setUnit(Key<Unit> unit) {
		this.unit = unit;
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

	public Integer getMaxDistance() {
		return maxDistance;
	}

	public void setMaxDistance(Integer maxDistance) {
		this.maxDistance = maxDistance;
	}

}
