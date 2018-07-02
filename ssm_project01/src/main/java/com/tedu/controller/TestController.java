package com.tedu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tedu.dao.PersonMapper;
import com.tedu.entity.Person;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	PersonMapper personDao;
	
	@RequestMapping("/person")
	public String test_person() {
		List<Person> person =  personDao.SelPerson();
		System.out.println(person);
		return "pers";
	}
	
	@RequestMapping("/test")
	public String test() {
		System.out.println("test.....");
		return "test";
	}
	
	@RequestMapping("/index")
	public String index() {
		System.out.println("index.html.....");
		return "index";
	}
}
