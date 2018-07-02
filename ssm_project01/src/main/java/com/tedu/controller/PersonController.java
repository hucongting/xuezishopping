package com.tedu.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tedu.dao.PersonMapper;
import com.tedu.entity.Person;

@Controller
@RequestMapping("/person")
public class PersonController {

	@Autowired
	PersonMapper personDao;
	
	@RequestMapping("/all")
	public String personSel(HttpSession session) {
		List<Person> personlist  = personDao.SelPerson();
		System.out.println(personlist);
		session.setAttribute("person_list", personlist);
		return "person";
	}
	
	@RequestMapping("/personbyid")
	@ResponseBody
	public Person personSelById(@RequestParam String id) {
		Person person = personDao.SelPersonById(id);
		System.out.println(person);
		return person;
	}
}
