package com.zhiyou.mapper;

import com.zhiyou.model.User;

public interface UserMapper {
	// 注册用户
	public void add(User user);

	// 修改用户
	public void update(User user);

	// 查询用户
	public User selectById(int id);

	//
	public User selectByAccounts(String accounts);

}
