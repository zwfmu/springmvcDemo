package service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import core.BaseTest;
import cn.wfzhu.springdemo.service.demo.TestService;


public class DemoService extends BaseTest {
	@Autowired
	private TestService testService;
	
	@Test
	public void test001(){
		String a = testService.helloWorld();
		System.out.println(a);
	}

	public TestService getTestService() {
		return testService;
	}

	public void setTestService(TestService testService) {
		this.testService = testService;
	}
	
	
}
