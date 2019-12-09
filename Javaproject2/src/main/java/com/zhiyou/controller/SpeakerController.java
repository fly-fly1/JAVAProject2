package com.zhiyou.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou.model.Speaker;
import com.zhiyou.service.SpeakerService;
import com.zhiyou.util.FTPUtil;

@Controller
public class SpeakerController {
	@Autowired
	SpeakerService service;

	@RequestMapping("speaker_manage")
	public String show(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		int count = service.selectCount();
		int page = req.getParameter("page") == "" || req.getParameter("page") == null ? 1
				: Integer.valueOf(req.getParameter("page"));
		req.setAttribute("count", count);
		req.setAttribute("page", page);
		req.setAttribute("list", service.selectAllLimit((page - 1) * 5, 5));
		return "speakermanage";
	}

	@RequestMapping("speaker_delete")
	public String delete(Integer id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Integer[] ids = { id };
		service.delete(ids);
		return "forward:speaker_manage";
	}

	@RequestMapping("speaker_deleteAll")
	public void deleteAll(Integer[] ids, HttpServletRequest req, HttpServletResponse resp) throws IOException {

		service.delete(ids);
		resp.getWriter().write("success");
	}

	@RequestMapping("speaker_add")
	public String add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return "speakerupdate";
	}

	@RequestMapping("speaker_update")
	public String update(Integer id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Speaker speaker = service.selectById(id);
		req.setAttribute("speaker", speaker);
		return "speakerupdate";
	}

	@RequestMapping("speaker_alter.do")
	public String alter(Speaker speaker, MultipartFile image, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		if (image.getSize() != 0) {
			String pic_url = FTPUtil.upload(image.getInputStream(), image.getOriginalFilename());
			speaker.setPic_url(pic_url);
		}

		if (speaker.getId() == null) {
			service.add(speaker);
		} else {
			service.update(speaker);
		}

		return "forward:speaker_manage";
	}

}
