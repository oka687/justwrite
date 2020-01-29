package org.mk.service;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.mk.domain.UserInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	  "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class WriteServiceImplTests {

	  @Setter(onMethod_ = {@Autowired} )

	  private WriteService service;

	  
	  @Test
	  public void testUser()throws Exception{
		  	
		  System.out.println(service.readUser("테스터아이디"));
		  
	  }
	  
	  
	@Test
	  public void testRegister()throws Exception{
	    
	    UserInfo info = new UserInfo();

	    info.setId("1디eee1");
	    info.setPw("1234");
	    info.setNickName("ddddwweeee2677722d");
	    info.setEMail("okda1");

	    service.userRegist(info);

	    System.out.println(info.getNickName()+"님이 가입하셨습니다.");

	  }

	
	
	  
}
