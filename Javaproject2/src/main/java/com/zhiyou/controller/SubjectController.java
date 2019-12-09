package com.zhiyou.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;
import com.zhiyou.model.Subject;
import com.zhiyou.model.Video;
import com.zhiyou.model.Videos;
import com.zhiyou.service.SubjectService;

@Controller
public class SubjectController {

	@Autowired
	SubjectService service;

	@RequestMapping("subject_show")
	public String show(Integer subject_id, HttpServletRequest req, HttpServletResponse resp) {
		Subject subject = service.selectById(subject_id);
		req.getSession().setAttribute("subject", subject);
		List<Course> courList = service.selectCourses(subject_id);
		req.getSession().setAttribute("courList", courList);
		for (int i = 0; i < courList.size(); i++) {
			System.out.println("********" + courList.get(i).getId());
			List<Videos> videoList = service.selectVideos(courList.get(i).getId());
			req.getSession().setAttribute("videoList" + i, videoList);
		}
		return "subjectshow";
	}

	@RequestMapping("subject_video_show")
	public String videoShow(Integer course_id, Integer subject_id, Integer video_id, HttpServletRequest req,
			HttpServletResponse resp) {
		Course course = service.selectCourse(course_id);
		Subject subject = service.selectById(subject_id);
		Video video = service.selectVideo(video_id);
		Integer oldNum = video.getPlay_num() == null ? 0 : video.getPlay_num();
		video.setPlay_num(oldNum + 1);
		service.updatePlay(video);
		req.setAttribute("subject", subject);
		req.setAttribute("course", course);
		req.setAttribute("video", video);

		Speaker speaker = service.selectSpeaker(video.getSpeaker_id());
		req.setAttribute("speaker", speaker);
		List<Videos> videos = service.selectVideos2(speaker.getId());
		req.setAttribute("videos", videos);

		return "videoplay";
	}

}
