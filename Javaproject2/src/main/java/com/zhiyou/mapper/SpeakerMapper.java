package com.zhiyou.mapper;

import java.util.List;

import com.zhiyou.model.Speaker;

public interface SpeakerMapper {

	public void add(Speaker speaker);

	public void update(Speaker speaker);

	public Speaker selectById(Integer id);

	public List<Speaker> selectAll();

	public List<Speaker> selectAllLimit(int page, int number);

	public void delete(Integer[] ids);

	public int selectCount();
}
