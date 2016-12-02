package org.lanqiao.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lanqiao.business.PostBusiness;
import org.lanqiao.commonutils.RequestParameterUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/PostController")
public class PostController {
	@Autowired
	PostBusiness pus ;
	
	@RequestMapping("/ShowInfo")
	public String ShowInfo(HttpServletRequest request){
		request.setAttribute("info", pus.getreplayById(Integer.parseInt(request.getParameter("id"))));
		return "info";
	}
	@RequestMapping("/addReplay")
	public void addReplay(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		RequestParameterUtils.requestParamToMap(request, map, "pid","context","postId","username","time","replayPeople");
		map.put("replay_date", new Timestamp(Long.parseLong((String) map.get("time"))));
		int status =pus.insertReplay(map);
		PrintWriter out = null ;
		try {
			response.setCharacterEncoding("UTF-8");
			out= response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(status>0){
			out.write("{status:y,mess:成功}");
			out.close();
		}else{
			out.write("{status:n,mess:失败}");
			out.close();
		}
		
	}
	@RequestMapping("/login")
	public String login(String username,String password ,HttpSession session){
		Map<String,Object> user =pus.getUserByNP(username,password);
		if(user!=null)
		session.setAttribute("loginUser",user);
		return "redirect:/PostController/search";
		
	}
	@RequestMapping("/search")
	public String search(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		RequestParameterUtils.requestParamToMap(request,map,"postAuthor","postTitle","startDate","endDate");
		List<Map<String, Object>> posts = pus.searchPost(map);
		request.setAttribute("posts",posts);
		return "posts";
	}
	@RequestMapping("/logout")
	public String loginout(HttpSession session){
		  session.removeAttribute("loginUser");
		  return "redirect:/PostController/search";
	}

	@RequestMapping(value="/regist", method = RequestMethod.POST)
	public void regist(@RequestParam MultipartFile[] uplodFile ,HttpServletRequest request,HttpServletResponse response){
		        Map<String,Object>userInf = new HashMap<String,Object>();
		        RequestParameterUtils.requestParamToMap(request, userInf, "username","password");
		        userInf.put("regdate",new java.sql.Timestamp(new Date().getTime()));
		        PrintWriter out=null;
				try {
					response.setCharacterEncoding("UTF-8");
					out = response.getWriter();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				//插入数据库 Employy
				if(uplodFile!=null){
					//获取容器所在的绝对路径
					String	 webpath  = request.getServletContext().getRealPath("/");
					System.out.println("webpath:"+webpath);
					File  file=new File(webpath+"/upload/");
					if(!file.exists()){
						file.mkdir();
					}
					for(int i=0;i<uplodFile.length;i++){
						String filename =uplodFile[i].getOriginalFilename();
						//更换名称  时间字符串  作为  新的文件名字
							File  imagefile=new File(webpath+"/upload/"+filename);
							try {
								uplodFile[i].transferTo(imagefile);
							} catch (IllegalStateException e) {
								e.printStackTrace();
							} catch (IOException e) {
								e.printStackTrace();
							}
							userInf.put("userimg","upload/"+filename);
					}
				}
				int rt =pus.addUser(userInf);
		if(rt==1)
			out.write("{statu:y,message:注册成功}");
			out.close();
		
	}
	@RequestMapping("/delPosts")
	public void delPosts(String[] id,HttpServletResponse response){
		
		PrintWriter out=null;
		try {
			response.setCharacterEncoding("UTF-8");
			 out= response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int rt =pus.delPosts(id);
		if(rt>0)
		out.write("{statu:'y',message:'成功'}");
		out.close();
		
	}
	@RequestMapping("/addPost")
	public void addPost(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map=new HashMap<String,Object>();
		RequestParameterUtils.requestParamToMap(request, map, "username","title","content");
		map.put("postDate", new Timestamp(new Date().getTime()));
		int rt =pus.addPost(map);
	
		PrintWriter out=null;
		try {
			out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rt>0){
			out.write("1");
			out.close();
		}else{
			out.write("0");
			out.close();
		}
		
	}
}
