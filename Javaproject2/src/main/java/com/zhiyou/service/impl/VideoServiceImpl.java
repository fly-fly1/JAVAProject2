package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.VideoMapper;
import com.zhiyou.model.Video;
import com.zhiyou.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {
	@Autowired
	VideoMapper mapper;

	public void add(Video video) {
		mapper.add(video);
	}

	public void update(Video video) {
		mapper.update(video);
	}

	public void delete(Integer[] ids) {
		mapper.delete(ids);
	}

	public List<Video> selectAll(int page, int number) {
		return mapper.selectAll(page, number);
	}

	public Video selectById(Integer video_id) {
		return mapper.selectById(video_id);
	}

	public List<Video> selectLike(String title, Integer speaker_id, Integer course_id, int page, int number) {
		return mapper.selectLike(title, speaker_id, course_id, page, number);
	}

	public int selectCount() {
		return mapper.selectCount();
	}

	public int selectCountLike(String title, Integer speaker_id, Integer course_id) {
		return mapper.selectCountLike(title, speaker_id, course_id);
	}

}
