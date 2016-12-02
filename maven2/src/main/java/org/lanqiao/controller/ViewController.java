package org.lanqiao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 配置一个空的可直接跳转到web-inf下view文件夹的控制器
 *   :/项目/view/页面名
 * @author LZK
 *
 */
@Controller
public class ViewController {
	@RequestMapping("/view/{url}")
	public String view(@PathVariable(value="url") String page){
		return page;
	}

}
