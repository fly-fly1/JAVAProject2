package com.zhiyou.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
	private Integer admin_id;
	// 管理员账号
	private String accounts;
	private String password;
	private String admin_remark;
}
