package com.zhiyou.service;

import java.util.List;

import com.zhiyou.model.Course;
import com.zhiyou.model.Coursec;

public interface CourseService {
	public void add(Course course);

	public void update(Course course);

	public List<Coursec> selectAllLimit(int page, int number);

	public Course selectById(Integer id);

	public List<Course> selectAll();

	public void delete(Integer[] ids);

	public int selectCount();
}
