package cn.wfzhu.springdemo.controller.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import cn.wfzhu.springdemo.service.demo.TestService;

@RestController
public class TestController {
	@Autowired
	private TestService testService;
	
	@RequestMapping(value="hellword")
	public ModelAndView helloWrold(){
		String a = testService.helloWorld();
		System.out.println(a);
		return null;
	}
}
