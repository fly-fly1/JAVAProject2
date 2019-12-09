package com.zhiyou.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.UserMapper;
import com.zhiyou.model.User;
import com.zhiyou.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper mapper;

	public void add(User user) {
		mapper.add(user);
	}

	public void update(User user) {
		mapper.update(user);
	}

	public User selectById(int id) {
		return mapper.selectById(id);
	}

	public User userLogin(HttpServletRequest req, String accounts, String password) {
		User user = mapper.selectByAccounts(accounts);
		if (user != null) {
			// 账号存在，密码错误
			if (!user.getPassword().equals(password)) {
				req.setAttribute("msg", "the password error");
				return null;
			}
		} else {
			// 账号不存在
			req.setAttribute("msg", "the accounts error");
		}
		return user;
	}

	public String userReg(String email) {
		if (mapper.selectByAccounts(email) == null) {
			return "success";
		}
		return "";
	}

}
