package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.CourseMapper;
import com.zhiyou.model.Course;
import com.zhiyou.model.Coursec;
import com.zhiyou.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {
	@Autowired
	CourseMapper mapper;

	public Course selectById(Integer id) {
		return mapper.selectById(id);
	}

	public List<Course> selectAll() {
		return mapper.selectAll();
	}

	public void add(Course course) {
		mapper.add(course);
	}

	public void update(Course course) {
		mapper.update(course);
	}

	public List<Coursec> selectAllLimit(int page, int number) {
		return mapper.selectAllLimit(page, number);
	}

	public void delete(Integer[] ids) {
		mapper.delete(ids);
	}

	public int selectCount() {
		return mapper.selectCount();
	}

}
