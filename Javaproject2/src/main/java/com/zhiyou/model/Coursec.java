package com.zhiyou.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Coursec {
	private Integer id;
	private String course_title;
	private String course_desc;
	private Integer subject_id;

	private Subject subject;
}
