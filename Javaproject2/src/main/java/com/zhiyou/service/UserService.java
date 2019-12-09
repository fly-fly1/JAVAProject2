package com.zhiyou.service;

import javax.servlet.http.HttpServletRequest;

import com.zhiyou.model.User;

public interface UserService {
	// 注册用户
	public void add(User user);

	// 修改用户
	public void update(User user);

	// 查询用户
	public User selectById(int id);

	//
	public User userLogin(HttpServletRequest req, String accounts, String password);

	public String userReg(String email);
}
