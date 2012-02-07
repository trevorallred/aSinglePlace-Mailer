package com.asingleplace.mailer.model;

import java.util.Date;

import javax.persistence.Id;

import com.google.appengine.api.datastore.Category;
import com.google.appengine.api.datastore.GeoPt;
import com.googlecode.objectify.Key;

public class Email {
	@Id
	private Long id;
	private String subject;
	private String body;
	private Key<User> writer;
	private Date creationDate;
	private GeoPt location;
	private Key<Category>[] tags;

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

	public GeoPt getLocation() {
		return location;
	}

	public void setLocation(GeoPt location) {
		this.location = location;
	}

	public Key<Category>[] getTags() {
		return tags;
	}

	public void setTags(Key<Category>[] tags) {
		this.tags = tags;
	}

}
