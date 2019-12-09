package com.zhiyou.mapper;

import java.util.List;

import com.zhiyou.model.Video;
import com.zhiyou.model.Videos;

public interface VideoMapper {
	// 添加
	public void add(Video video);

	// 修改
	public void update(Video video);

	// 批量删除
	public void delete(Integer[] ids);

	// 查询所有
	public List<Video> selectAll(int page, int number);

	// 通过id查询
	public Video selectById(Integer video_id);

	// 模糊查询
	public List<Video> selectLike(String title, Integer speaker_id, Integer course_id, int page, int number);

	// 查询记录总数
	public int selectCount();

	public int selectCountLike(String title, Integer speaker_id, Integer course_id);

	public List<Videos> selectByCourse(Integer course_id);

	public List<Videos> selectBySpeaker(Integer speaker_id);

}
