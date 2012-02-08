package com.asingleplace.mailer;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.asingleplace.mailer.model.User;

public class Mailer {
	// User: asingleplace
	// Password: 23Lake

	static public void sendMail(User user, String subject, String body) {
		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);

		try {
			Message msg = new MimeMessage(session);
			InternetAddress noreply = new InternetAddress("noreply@asingleplace.com", "A Single Place Mailer");
			msg.setFrom(noreply);
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail(), user.getFullName()));
			msg.setSubject(subject);
			msg.setText(body);
			Transport.send(msg);

		} catch (AddressException e) {
			// ...
		} catch (MessagingException e) {
			// ...
		} catch (UnsupportedEncodingException e) {
		}
	}
}
