package org.lanqiao.business;

import java.util.List;
import java.util.Map;


import org.lanqiao.vo.Tree;
import org.springframework.stereotype.Service;

@Service
public interface PostBusiness {
	/**
	 * 添加回复
	 * @param map
	 * @return
	 */
	int insertReplay(Map<String, Object> map);
	/**
	 * 查询帖子详细信息
	 * @param id
	 * @return
	 */
	Tree<Map<String,Object>> getreplayById(int id);

	/**
	 * 根据用户名和密码，查询用户信息
	 * @param username
	 * @param password
	 * @return
	 */
	Map<String, Object> getUserByNP(String username, String password);

	

	/**
	 * 查询帖子
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> searchPost(Map<String, Object> map);

	/**
	 * 添加用户
	 * @param userInf
	 * @return
	 */
	int addUser(Map<String, Object> userInf);
	/**
	 * 删除帖子
	 * @param id
	 * @return
	 */
	int delPosts(String[] id);
	/**
	 * 帖子
	 * @param map
	 * @return
	 */
	int addPost(Map<String, Object> map);
	
}
