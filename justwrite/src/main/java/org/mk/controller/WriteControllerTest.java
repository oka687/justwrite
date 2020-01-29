package org.mk.controller;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })

public class WriteControllerTest {
	
	  @Setter(onMethod_ = { @Autowired })
	  private WebApplicationContext ctx;
	  private MockMvc mockMvc;
	  
	  @Before
	  public void setup() {
	    this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	  }
	  
	  @Test
	  public void testSearch() throws Exception {

		    System.out.println(mockMvc.perform(MockMvcRequestBuilders
		        .get("/justwrites/userSearch")
		        .param("id", "테스터아이디"))
		        .andReturn()
		        .getModelAndView().getModelMap());
	  }
	  
	  @Test
	  public void testUserRegist()throws Exception {
		  
	  
		  	String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/justwrites/regist")
		  	        .param("id", "테글 제목")
		  	        .param("pw", "1234")
		  	        .param("nickName", "user010")
		  	      .param("eMail", "user00")
		  	    ).andReturn().getModelAndView().getViewName();
		  	    
		  	  System.out.println(resultPage);


		 
	  }

}	 
