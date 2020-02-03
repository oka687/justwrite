package org.mk.service;

import org.mk.domain.Login;
import org.mk.domain.UserInfo;

public interface WriteRequestService {
	
	
	public UserInfo idCheck(String id);
	
	public UserInfo nickCheck(String nick);
	
	public Login loginc(Login login);
}
