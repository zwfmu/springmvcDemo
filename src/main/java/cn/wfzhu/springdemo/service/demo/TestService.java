package cn.wfzhu.springdemo.service.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wfzhu.springdemo.dao.demo.TestDao;

@Service
public class TestService {
	/*@Autowired
   private TestDao testDao;*/
	
	public String helloWorld() {
		return "ok";
	}
	
}
