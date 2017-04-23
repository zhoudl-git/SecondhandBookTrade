package com.booktrade.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbItem;
import com.booktrade.service.ItemService;

/**   
 * @ClassName:  ItemController   
 * @Description: 书籍操作功能控制   
 * @author: zhoudl  
 * @date:   2017年4月8日 上午11:06:43   
 *      
 */  
@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/{itemId}")
	@ResponseBody
	private TbItem getItemById(@PathVariable Long itemId) {
		TbItem item = itemService.getItemById(itemId);
		return item;
	}
	
	@RequestMapping("/list")
	@ResponseBody
	private LigerUIDataGridResult getAllItem(@RequestParam(defaultValue="1") Integer page, 
								@RequestParam(defaultValue="30") Integer rows) {
		
		LigerUIDataGridResult result = itemService.getAllItem(page, rows);
		return result;
	}
	@RequestMapping("/deleteBookById")
	@ResponseBody
	public SystemReturnResult deleteBookById(Long bookId) {
		int flag = itemService.deleteBookById(bookId);
		return new SystemReturnResult(flag);
	}
	@RequestMapping("/deleteBooksById")
	@ResponseBody
	public SystemReturnResult deleteBooksByIdsOK(@RequestParam("bookIds")Long []bookIds) {
		int flag = itemService.deleteBooksByIdsOK(bookIds);
		return new SystemReturnResult(flag);
	}
	

}
