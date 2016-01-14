package cn.wfzhu.springdemo.service.demo;

import org.springframework.stereotype.Service;


@Service
public class TestService {
	/*@Autowired
   private TestDao testDao;*/
	
	public String helloWorld() {
		return "ok";
	}
	
}
