package com.zhiyou.service;

import javax.servlet.http.HttpServletRequest;

import com.zhiyou.model.Admin;

public interface AdminService {

	public Admin adminLogin(HttpServletRequest req, String accounts, String password);

}
