package com.tedu.dao;

import java.util.List;

import com.tedu.entity.Person_Two;

public interface PersonTwoMapper {
	List<Person_Two> SelPersonTwoByPid(String id);
}
