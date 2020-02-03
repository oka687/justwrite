package org.mk.mapper;

import org.mk.domain.UserInfo;

public interface RequestMapper {
	
	

	public UserInfo idCheck(String id);
	
	public UserInfo nickCheck(String nick);
}
