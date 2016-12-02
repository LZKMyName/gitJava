package org.lanqiao.business.impl;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.lanqiao.business.PostBusiness;
import org.lanqiao.mapper.PostMapper;
import org.lanqiao.vo.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PostBusinessImpl implements PostBusiness {

	@Autowired
	PostMapper postMapper;
	@Override
	public Tree<Map<String, Object>> getreplayById(int id) {
		return dealResult(postMapper.getreplayById(id));
	}
	@Override
	public Map<String, Object> getUserByNP(String username, String password) {
		Map<String, Object> map =new HashMap<String,Object>();
		map.put("username", username);
		map.put("password", password);
		Map<String,Object> result =postMapper.getUserByUP(map);
		 return result;
	}
	@Override
	public int insertReplay(Map<String, Object> map) {
		return postMapper.insertReplay(map);
	}
	@Override	
	public List<Map<String, Object>> searchPost(Map<String, Object> map) {
		return postMapper.searchPosts(map);
	}
	@Override
	public int addUser(Map<String, Object> userInf) {
		
		return postMapper.addUser(userInf);
	}
	
	@Override
	public int delPosts(String[] id) {
		//删除依赖
	   postMapper.delPostsReplay(id);
	  
	   //备份post数据
	   postMapper.backPosts(id);
	   //删除post数据
		return postMapper.delPosts(id);
	}
	@Override
	public int addPost(Map<String, Object> map) {
		return postMapper.addPost(map);
	}
	
	
	
	private Tree<Map<String,Object>> dealResult(List<Map<String, Object>> lists){
		HashSet<Map<String, Object>> hashSet = new HashSet<Map<String, Object>>(lists);//拷贝到HashSet
		Tree<Map<String,Object>> tree=new Tree<Map<String,Object>>();//内容
		//拷贝一份内容
		Map<String,Object> content =new HashMap<String,Object>(hashSet.iterator().next());//提取内容
			content.remove("replayId");
			content.remove("replayContext");
			content.remove("replayDate");
			content.remove("replayPid");
			content.put("replayId", 0);
		tree.setValue(content);
		for(Map<String,Object> bean :hashSet){//去除多余列
			bean.remove("postId");
			bean.remove("postAuthor");
			bean.remove("postTitle");
			bean.remove("postContent");
			bean.remove("postDate");
		}
		fillTree(tree, hashSet);
		sortByDate(tree);
		return tree;
	}
	
	/**
	 * 对评论按时间排序
	 * @param tree
	 */
	private void sortByDate(Tree<Map<String, Object>> tree) {
		List<Tree<Map<String, Object>>> treeList=tree.getTrees();
		Collections.sort(treeList,new Comparator<Tree<Map<String,Object>>>() {
			@Override
			public int compare(Tree<Map<String, Object>> o1, Tree<Map<String, Object>> o2) {
				return ((Timestamp) (o1.getValue().get("replayDate"))).compareTo((Timestamp) (o2.getValue().get("replayDate")));
			}
		});
		for (int i = 0; i < treeList.size(); i++) {
			sortByDate(treeList.get(i));
		}
	}

	private void fillTree(Tree<Map<String, Object>> tree, HashSet<Map<String, Object>> hashSet) {
		Map<String, Object> bean=null;
		List<Tree<Map<String, Object>>> trees=null;
		Iterator<Map<String, Object>> it=hashSet.iterator();
		while(it.hasNext()){
			bean=it.next();
			trees=tree.getTrees();
			if(tree.getValue().get("replayId")==bean.get("replayPid")){
            	trees.add(new Tree<Map<String,Object>>(bean));//添加到下一级
            	hashSet.remove(bean);//移除该值
			}
		}
		trees=tree.getTrees();
		for (int i = 0; i < trees.size(); i++) {
			tree= trees.get(i);
			fillTree(tree,hashSet);
		}
		
		
	}
	
	
}


