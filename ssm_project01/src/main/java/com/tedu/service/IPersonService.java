package com.tedu.service;

import java.util.List;

import com.tedu.entity.Person;

public interface IPersonService {
	List<Person> SelPerson();
	Person SelPersonById(String id);
}
