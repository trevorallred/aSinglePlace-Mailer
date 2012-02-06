package com.asingleplace.mailer.dao;

import com.asingleplace.mailer.model.*;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.util.DAOBase;

public class MyDAO extends DAOBase {
	static {
		ObjectifyService.register(User.class);
		ObjectifyService.register(Unit.class);
	}
}
