package com.zhiyou.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.model.Course;
import com.zhiyou.service.CourseService;
import com.zhiyou.service.SubjectService;

@Controller
public class CourseController {
	@Autowired
	CourseService service;
	@Autowired
	SubjectService services;

	@RequestMapping("course_manage")
	public String show(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		int count = service.selectCount();
		int page = req.getParameter("page") == "" || req.getParameter("page") == null ? 1
				: Integer.valueOf(req.getParameter("page"));
		req.setAttribute("count", count);
		req.setAttribute("page", page);
		req.setAttribute("list", service.selectAllLimit((page - 1) * 5, 5));
		return "coursemanage";
	}

	@RequestMapping("course_delete")
	public String delete(Integer id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Integer[] ids = { id };
		service.delete(ids);
		return "forward:course_manage";
	}

	@RequestMapping("course_deleteAll")
	public void deleteAll(Integer[] ids, HttpServletRequest req, HttpServletResponse resp) throws IOException {

		service.delete(ids);
		resp.getWriter().write("success");
	}

	@RequestMapping("course_add")
	public String add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setAttribute("subjectList", services.selectAll());
		return "courseupdate";
	}

	@RequestMapping("course_update")
	public String update(Integer id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Course course = service.selectById(id);
		req.setAttribute("course", course);
		req.setAttribute("subjectList", services.selectAll());
		return "courseupdate";
	}

	@RequestMapping("course_alter")
	public String alter(Course course, HttpServletRequest req, HttpServletResponse resp) throws IOException {

		if (course.getId() == null) {
			service.add(course);
		} else {
			service.update(course);
		}

		return "forward:course_manage";
	}
}
