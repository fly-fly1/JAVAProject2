package com.zhiyou.service;

import java.util.List;

import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;
import com.zhiyou.model.Subject;
import com.zhiyou.model.Video;
import com.zhiyou.model.Videos;

public interface SubjectService {
	public List<Subject> selectAll();

	public Subject selectById(Integer subject_id);

	public List<Course> selectCourses(Integer subject_id);

	public List<Videos> selectVideos(Integer course_id);

	public List<Videos> selectVideos2(Integer speaker_id);

	public Course selectCourse(Integer course_id);

	public Video selectVideo(Integer video_id);

	public void updatePlay(Video video);

	public Speaker selectSpeaker(Integer speaker_id);
}
