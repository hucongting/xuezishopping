package com.tedu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tedu.entity.Person;

public interface PersonMapper {
	List<Person> SelPerson();
	Person SelPersonById(String id);
	List<Person> SelPersonByLike(@Param("str") String str);
	void DelPersonById(int id);
	void InsertPerson(Person person);
	void UpdatePerson(Person person);
	List<Person> SelPersonListByFY();
}
