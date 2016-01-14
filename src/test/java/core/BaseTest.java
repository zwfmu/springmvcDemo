package core;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;



/** 
 * Junit 基础类,加载环境  
 */  
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class BaseTest extends AbstractJUnit4SpringContextTests {
	 
	
}
