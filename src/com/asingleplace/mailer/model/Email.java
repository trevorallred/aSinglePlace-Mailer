package com.asingleplace.mailer.model;

import java.util.Date;

import javax.persistence.Id;

import com.googlecode.objectify.Key;

public class Email {
	@Id
	private Long id;
	private String subject;
	private String body;
	private Key<User> writer;
	private Date creationDate;
	private Integer latitude;
	private Integer longitude;
	private Key<Tag>[] tags;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Key<User> getWriter() {
		return writer;
	}

	public void setWriter(Key<User> writer) {
		this.writer = writer;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
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

	public Key<Tag>[] getTags() {
		return tags;
	}

	public void setTags(Key<Tag>[] tags) {
		this.tags = tags;
	}

}
