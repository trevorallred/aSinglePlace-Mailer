package com.asingleplace.mailer;

public class Utilities {
	public static long parseLong(String value) {
		if (isEmpty(value))
			return 0;
		try {
			return Long.parseLong(value);
		} catch (Exception e) {
			return 0;
		}
	}

	public static boolean isEmpty(String value) {
		if (value == null)
			return true;

		if (value.trim().isEmpty())
			return true;
		return false;
	}

}
