package com.tedu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tedu.dao.PersonMapper;
import com.tedu.entity.Person;
import com.tedu.service.IPersonService;

@Service
public class PersonServiceImpl implements IPersonService {

	@Resource
	PersonMapper personDao;
	
	@Override
	public List<Person> SelPerson() {
		// TODO Auto-generated method stub
		return personDao.SelPerson();
	}

	@Override
	public Person SelPersonById(String id) {
		// TODO Auto-generated method stub
		return personDao.SelPersonById(id);
	}

	@Override
	public List<Person> SelPersonByLike(String str) {
		// TODO Auto-generated method stub
		return personDao.SelPersonByLike(str);
	}

	@Override
	public void DelPersonById(int id) {
		// TODO Auto-generated method stub
		personDao.DelPersonById(id);
	}

	@Override
	public void InsertPerson(Person person) {
		// TODO Auto-generated method stub
		personDao.InsertPerson(person);
	}

	@Override
	public void UpdatePerson(Person person) {
		// TODO Auto-generated method stub
		personDao.UpdatePerson(person);
	}

	@Override
	public List<Person> SelPersonListByFY() {
		// TODO Auto-generated method stub
		return personDao.SelPersonListByFY();
	}

}
