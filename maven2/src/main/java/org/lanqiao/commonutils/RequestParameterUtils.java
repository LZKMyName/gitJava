package org.lanqiao.commonutils;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
public class RequestParameterUtils {
	/**
	 * 封装request的请求参数到map中
	 * @param list 保存要请求的参数信息若为""，则存为null：动态sql语句进行非null的判断
	 * @param request 携带请求信息的request对象
	 * @return
	 */
	public static  void  requestParamToMap(HttpServletRequest request,Map<String,Object> map,String... list){
		Object obj= null;
		for(String str:list){
			obj = request.getParameter(str);
			if(obj!="")
				map.put(str, obj);
			else
				map.put(str,null);
		}
	}
	/**
	 * 封装request的请求参数到map中
	 * @param list 保存要请求的参数信息若为没有null值或""动态sql可不判断
	 * @param request 携带请求信息的request对象
	 * @return
	 */
	public static  void  requestParamToMap2(HttpServletRequest request,Map<String,Object> map,String... list){
		Object obj= null;
		for(String str:list){
			obj = request.getParameter(str);
			if(obj!=""&&obj!=null)
				map.put(str, obj);
		}
	}
}
