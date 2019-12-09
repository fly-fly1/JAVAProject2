package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.SpeakerMapper;
import com.zhiyou.model.Speaker;
import com.zhiyou.service.SpeakerService;

@Service
public class SpeakerServiceImpl implements SpeakerService {
	@Autowired
	SpeakerMapper mapper;

	public Speaker selectById(Integer id) {
		return mapper.selectById(id);
	}

	public List<Speaker> selectAll() {
		return mapper.selectAll();
	}

	public void add(Speaker speaker) {
		mapper.add(speaker);
	}

	public void update(Speaker speaker) {
		mapper.update(speaker);
	}

	public void delete(Integer[] ids) {
		mapper.delete(ids);
	}

	public int selectCount() {
		return mapper.selectCount();
	}

	public List<Speaker> selectAllLimit(int page, int number) {
		return mapper.selectAllLimit(page, number);
	}

}
