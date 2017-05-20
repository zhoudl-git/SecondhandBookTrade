package com.booktrade.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**   
 * @ClassName:  BookTradePageController   
 * @Description: 系统页面跳转控制   
 * @author: zhoudl  
 * @date:   2017年4月8日 上午11:05:20   
 *      
 */  
@Controller
public class BookTradePageController {

	/**   
	 * @Title: showIndex   
	 * @Description: 展示首页   
	 * @param: @return      
	 * @return: String      
	 * @throws   
	 */  
	@RequestMapping("/")
	public String showIndex() {
		return "login";
	}
	
	/**   
	 * @Title: showPage   
	 * @Description: 展示功能页面  
	 * @param: @param page
	 * @param: @return      
	 * @return: String      
	 * @throws   
	 */  
	@RequestMapping("/{page}")
	public String showPage(@PathVariable String page) {
		return page;
	}
	@RequestMapping("/index")
	public String showIndexMain() {
		//return "secondHandBook_index";
		return "index1";
	}
	@RequestMapping("/afterIndex")
	public String showAfterIndexMain() {
		//return "secondHandBook_index";
		return "index";
	}
}