package com.tedu.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tedu.dao.PersonTwoMapper;
import com.tedu.entity.Person_Two;

@Controller
@RequestMapping("/persontwo")
public class PersonTwoController {

	@Autowired
	PersonTwoMapper persontwoDao; 

	@RequestMapping("/persontwobyid")
	@ResponseBody
	public List<Person_Two> personSelById(@RequestParam String id) {
		List<Person_Two> person_two = persontwoDao.SelPersonTwoByPid(id);
		System.out.println(person_two);
		return person_two;
	}
}
