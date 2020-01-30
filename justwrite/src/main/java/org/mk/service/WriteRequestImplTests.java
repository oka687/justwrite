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
public class WriteRequestImplTests {

	  @Setter(onMethod_ = {@Autowired} )

	  private WriteRequestService service;

	  
	  @Test
	  public void testUser()throws Exception{
		  	
		  System.out.println(service.idCheck("test"));
		  
		  
		  
	  }
	  

	  
}
