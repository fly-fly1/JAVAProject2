package com.zhiyou.mapper;

import java.util.List;

import com.zhiyou.model.Course;
import com.zhiyou.model.Coursec;

public interface CourseMapper {

	public void add(Course course);

	public void update(Course course);

	public List<Coursec> selectAllLimit(int page, int number);

	public Course selectById(Integer id);

	public List<Course> selectAll();

	public void delete(Integer[] ids);

	public int selectCount();

	public List<Course> selectBySubject(Integer subject_id);
}
