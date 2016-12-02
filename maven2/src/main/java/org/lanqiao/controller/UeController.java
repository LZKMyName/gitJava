package org.lanqiao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baidu.ueditor.ActionEnter;

/**
 * 控制UE的请求
 */
@WebServlet("/UeController")
public class UeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out= response.getWriter();
    	response.setContentType("text/html; charset=UTF-8");
    	request.setCharacterEncoding( "utf-8" );
    	response.setHeader("Content-Type" , "text/html");
    	String rootPath = request.getServletContext().getRealPath( "/" );
		out.write( new ActionEnter( request, rootPath ).exec() );   }
}
