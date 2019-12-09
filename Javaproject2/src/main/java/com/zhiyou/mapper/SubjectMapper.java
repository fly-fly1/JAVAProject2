package com.zhiyou.mapper;

import java.util.List;

import com.zhiyou.model.Subject;

public interface SubjectMapper {

	public List<Subject> selectAll();

	public Subject selectById(Integer subject_id);

}
