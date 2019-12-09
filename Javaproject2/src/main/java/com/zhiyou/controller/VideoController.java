package com.zhiyou.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou.model.Video;
import com.zhiyou.service.CourseService;
import com.zhiyou.service.SpeakerService;
import com.zhiyou.service.VideoService;
import com.zhiyou.util.FTPUtil;

@Controller
public class VideoController {
	@Autowired
	VideoService service;
	@Autowired
	SpeakerService services;
	@Autowired
	CourseService servicec;

	@RequestMapping("video_manage")
	public String show(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		int count = service.selectCount();
		int page = req.getParameter("page") == "" || req.getParameter("page") == null ? 1
				: Integer.valueOf(req.getParameter("page"));
		req.setAttribute("count", count);
		req.setAttribute("page", page);
		req.setAttribute("list", service.selectAll((page - 1) * 5, 5));
		req.setAttribute("speakerList", services.selectAll());
		req.setAttribute("courseList", servicec.selectAll());
		return "videomanage";
	}

	@RequestMapping("video_manageLike")
	public String showLike(String title, Integer speaker_id, Integer course_id, HttpServletRequest req,
			HttpServletResponse resp) throws IOException {
		System.out.println("title :" + title + "; speaker_id:" + speaker_id + "; course_id:" + course_id);
		int count = service.selectCountLike(title, speaker_id, course_id);
		int page = req.getParameter("page") == "" || req.getParameter("page") == null ? 1
				: Integer.valueOf(req.getParameter("page"));
		req.setAttribute("count", count);
		req.setAttribute("page", page);
		req.setAttribute("speaker_id", speaker_id);
		req.setAttribute("course_id", course_id);
		req.setAttribute("title", title);
		req.setAttribute("list", service.selectLike(title, speaker_id, course_id, (page - 1) * 5, 5));
		return "videomanagelike";
	}

	@RequestMapping("video_delete")
	public String delete(Integer video_id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Integer[] ids = { video_id };
		service.delete(ids);
		return "forward:video_manage";
	}

	@RequestMapping("video_deleteAll")
	public void deleteAll(Integer[] video_ids, HttpServletRequest req, HttpServletResponse resp) throws IOException {

		service.delete(video_ids);
		resp.getWriter().write("success");
	}

	@RequestMapping("video_add")
	public String add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setAttribute("speakerList", services.selectAll());
		req.setAttribute("courseList", servicec.selectAll());
		return "videoadd";
	}

	@RequestMapping("video_update")
	public String update(Integer video_id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Video video = service.selectById(video_id);
		req.setAttribute("video", video);
		req.setAttribute("speakerList", services.selectAll());
		req.setAttribute("courseList", servicec.selectAll());
		return "videoupdate";
	}

	@RequestMapping("video_alter.do")
	public String alter(Video obj, MultipartFile image, MultipartFile video, HttpServletRequest req,
			HttpServletResponse resp) throws IOException {
		if (image.getSize() != 0) {
			String image_url = FTPUtil.upload(image.getInputStream(), image.getOriginalFilename());
			obj.setImage_url(image_url);
		}
		if (video.getSize() != 0) {
			String video_url = FTPUtil.upload(video.getInputStream(), video.getOriginalFilename());
			obj.setVideo_url(video_url);
		}
		if (obj.getVideo_id() == null) {
			service.add(obj);
		} else {
			service.update(obj);
		}

		return "forward:video_manage";
	}
}
