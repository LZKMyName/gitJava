package org.lanqiao.mapper;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

@Repository
public interface PostMapper {
	

	/**
	 * 根据id获取回复
	 * @param id
	 * @return
	 */
	List<Map<String,Object>> getreplayById(int id);

	/**
	 * 根据用户名和密码获取用户信息
	 * @param map
	 * @return
	 */
	Map<String, Object> getUserByUP(Map<String, Object> map);

	/**
	 * 添加回复
	 * @param map
	 * @return
	 */
	int insertReplay(Map<String, Object> map);

	/**
	 * 查询帖子,模糊查询，和条件查询
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> searchPosts(Map<String, Object> map);

	/**
	 * 添加用户
	 * @param userInf
	 * @return
	 */
	int addUser(Map<String, Object> userInf);

	/**
	 * 删帖
	 * @param id
	 * @return
	 */
	int delPosts(String[] id);
	/**
	 * 删帖子的回复
	 * @param id
	 * @return
	 */
	int delPostsReplay(String[] id);
	/**
	 * 备份帖子
	 * @param id
	 * @return
	 */
	int backPosts(String[] id);
	/**
	 * 添加帖子
	 * @param map
	 * @return
	 */
	int addPost(Map<String, Object> map);
}
