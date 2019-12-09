package com.zhiyou.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Video {
	private Integer video_id;
	private String title;
	private String detail;
	private Integer time;
	private Integer speaker_id;
	private Integer course_id;
	private String video_url;
	private String image_url;
	private Integer play_num;
	// 多对一，每个视频都有讲师和课程信息
	private Speaker speaker;
	private Course course;
}
