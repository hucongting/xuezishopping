package com.tedu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tedu.dao.PersonTwoMapper;
import com.tedu.entity.Person_Two;
import com.tedu.service.IPersonTwoService;

@Service
public class PersonTwoServiceImple implements IPersonTwoService {

	@Resource
	PersonTwoMapper persontwoDao;
	
	@Override
	public List<Person_Two> SelPersonTwoByPid(String id) {
		// TODO Auto-generated method stub
		return persontwoDao.SelPersonTwoByPid(id);
	}

}
