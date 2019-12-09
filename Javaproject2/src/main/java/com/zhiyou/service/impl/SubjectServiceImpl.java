package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.CourseMapper;
import com.zhiyou.mapper.SpeakerMapper;
import com.zhiyou.mapper.SubjectMapper;
import com.zhiyou.mapper.VideoMapper;
import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;
import com.zhiyou.model.Subject;
import com.zhiyou.model.Video;
import com.zhiyou.model.Videos;
import com.zhiyou.service.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService {
	@Autowired
	SubjectMapper subjectMapper;
	@Autowired
	VideoMapper videoMapper;
	@Autowired
	CourseMapper courseMapper;
	@Autowired
	SpeakerMapper speakerMapper;

	public List<Subject> selectAll() {
		return subjectMapper.selectAll();
	}

	public Subject selectById(Integer subject_id) {
		return subjectMapper.selectById(subject_id);
	}

	public List<Course> selectCourses(Integer subject_id) {
		return courseMapper.selectBySubject(subject_id);
	}

	public List<Videos> selectVideos(Integer course_id) {
		return videoMapper.selectByCourse(course_id);
	}

	public Course selectCourse(Integer course_id) {
		return courseMapper.selectById(course_id);
	}

	public Video selectVideo(Integer video_id) {
		// TODO Auto-generated method stub
		return videoMapper.selectById(video_id);
	}

	public void updatePlay(Video video) {
		videoMapper.update(video);
	}

	public Speaker selectSpeaker(Integer speaker_id) {
		return speakerMapper.selectById(speaker_id);
	}

	public List<Videos> selectVideos2(Integer speaker_id) {
		return videoMapper.selectBySpeaker(speaker_id);
	}

}
