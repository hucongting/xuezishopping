package com.tedu.dao;

import java.util.List;

import com.tedu.entity.Person;

public interface PersonMapper {
	List<Person> SelPerson();
	Person SelPersonById(String id);
}
