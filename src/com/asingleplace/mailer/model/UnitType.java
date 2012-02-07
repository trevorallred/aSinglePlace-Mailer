package com.asingleplace.mailer.model;

import java.util.HashSet;
import java.util.Set;

public enum UnitType {
	Ward, Stake, Branch, Mission;

	public Set<UnitType> values(UnitType parent) {
		Set<UnitType> values = new HashSet<UnitType>();
		if (parent == null) {
			values.add(Stake);
			values.add(Mission);
		} else {
			values.add(Branch);
			if (parent.equals(Stake))
				values.add(Ward);
		}
		return values;
	}
}
