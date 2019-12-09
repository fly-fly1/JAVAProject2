package com.zhiyou.interceptor;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class FileTypeInterceptor implements HandlerInterceptor {
	/*
	 * 在请求controller方法前调用 如果返回true 代表放行
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean flag = true;
		// 判断当前请求是否是文件上传
		// 如果是文件上传的请求，请求一定会实现MultipartHttpServletRequest
		if (request instanceof MultipartHttpServletRequest) {
			MultipartHttpServletRequest mu = (MultipartHttpServletRequest) request;
			// 获得请求中中的所有文件
			Map<String, MultipartFile> fileMap = mu.getFileMap();
			Iterator<String> iterator = fileMap.keySet().iterator();
			while (iterator.hasNext()) {
				String forKey = (String) iterator.next();
				MultipartFile file = mu.getFile(forKey);
				if (file.getSize() > (1024 * 1024 * 1024)) {
					int number = (int) file.getSize() / 1024;
					request.setAttribute("msg", "上传文件为" + number + "M,请上传文件大小为1G以内");
					request.getRequestDispatcher("edit.jsp").forward(request, response);
					flag = false;
				}
				String fileName = file.getOriginalFilename();
				if (!chenFile(fileName)) {
					request.setAttribute("msg", "上传文件类型错误，请上传图片");
					request.getRequestDispatcher("edit.jsp").forward(request, response);
					flag = false;
				}
			}
		}
		return flag;
	}

	public boolean chenFile(String fileName) {
		// 该字符串代表放行的类型
		String suff = "jpg,jpeg,png,png,mp4";
		// 截取文件后缀
		String suffx = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
		if (suff.contains(suffx.trim().toLowerCase())) {// 文件后缀去掉空格，转成小写
			return true;
		}
		return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
