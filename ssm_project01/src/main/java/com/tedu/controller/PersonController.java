package com.tedu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
	
	@RequestMapping("/user_list")
	public String userSelList(HttpSession session) {
		List<Person> personlist  = personDao.SelPerson();
		System.out.println(personlist);
		session.setAttribute("user_list", personlist);
		return "redirect:/admin/user_list.jsp";
	}
	
	/**
	 * 模糊搜索
	 * @return
	 */
	@RequestMapping("/user_list_bylike")
	@ResponseBody
	public List<Person> SelPersonByLike(@RequestParam("str") String str) {
		List<Person> personlist = personDao.SelPersonByLike(str);
		System.out.println(personlist);
		return personlist;
	}
	
	/**
	 *  单个用户删除
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/deletebyid")
	public void DelPersonById(@RequestParam("id") String id,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try{
			personDao.DelPersonById(Integer.parseInt(id));
			out.println(true);
		}catch(Exception e) {
			out.println(false);
			System.out.println("删除异常.......");
		}
	}
	
	/**
	 *  批量删除用户
	 * @param checkedids
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/pl_deletebyid")
	public void Pl_DelPersonById(@RequestParam("checkedids") String checkedids,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String[] str = checkedids.split(",");
		try {
			for(int i=0;i<str.length;i++) {			
				personDao.DelPersonById(Integer.parseInt(str[i]));
			}
			out.println(true);
		}catch(Exception e) {
			System.out.println("删除异常");
			out.println(false);
		}
	}
	
	/**
	 *  添加会员
	 * @param person
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/insert_person")
	public void InsertPerson(Person person,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try {
			personDao.InsertPerson(person);
			System.out.println("添加成功");
			out.println(true);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("添加异常");
			out.println(false);
		}
	}
	
	/**
	 *  重定向到修改页面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateSelByid")
	public String UpdateSelById(@RequestParam String id,HttpServletRequest request) {
		Person person = personDao.SelPersonById(id);
		request.setAttribute("person", person);
		return "forward:/admin/update_user.jsp";
	}
	
	/**
	 *  修改操作
	 * @param person
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/updatepersonByid")
	public void UpdatePersonById(Person person,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try {
			personDao.UpdatePerson(person);
			System.out.println("update success-----");
			out.println(true);
		}catch(Exception e) {
			System.out.println("修改异常");
			out.println(false);
		}
	}
	
	
	//测试分页
	@RequestMapping("/personListFY")
	public String SelPersonListByFY(@RequestParam(defaultValue="1")Integer page,Model model,HttpServletResponse response) throws IOException {
		PageHelper.startPage(page,5);
		List<Person> personList = personDao.SelPersonListByFY();
		PageInfo<Person> p = new PageInfo<>(personList);
		model.addAttribute("page", p);
		model.addAttribute("personList", personList);
		response.getWriter().println(personList);
		return "index";
	}
	
}









