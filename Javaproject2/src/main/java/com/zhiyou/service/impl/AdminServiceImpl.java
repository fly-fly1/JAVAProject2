package com.zhiyou.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.AdminMapper;
import com.zhiyou.model.Admin;
import com.zhiyou.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper mapper;

	public Admin adminLogin(HttpServletRequest req, String accounts, String password) {
		Admin admin = mapper.selectByAccounts(accounts);
		if (admin != null) {
			// 账号存在，密码错误
			if (!admin.getPassword().equals(password)) {
				req.setAttribute("msg", "the password error");
				return null;
			}
		} else {
			// 账号不存在
			req.setAttribute("msg", "the accounts error");
		}
		return admin;
	}

}
