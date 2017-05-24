package com.booktrade.controller;


import java.util.List;

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
import com.booktrade.pojo.TbItemDesc;
import com.booktrade.pojo.User;
import com.booktrade.service.ItemService;
import com.booktrade.utils.StringUtil;

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
								@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request) {
		//Map<String, String> map = new HashMap<String,String>();
		LigerUIDataGridResult result = itemService.getAllItem(page, rows);
		return result;
	}
	@RequestMapping("/deleteBookById")
	@ResponseBody
	public SystemReturnResult deleteBookById(Long bookId) {
		//int flag = itemService.deleteBookById(bookId);
		int flag = itemService.updateBookById(bookId,"end");
		return new SystemReturnResult(flag);
	}
	@RequestMapping("/deleteBooksById")
	@ResponseBody
	public SystemReturnResult deleteBooksByIdsOK(@RequestParam("bookIds")Long []bookIds) {
		//int flag = itemService.deleteBooksByIdsOK(bookIds);
		int flag = itemService.updateBookByIds(bookIds);
		return new SystemReturnResult(flag);
	}
	@RequestMapping("/updateBookById")
	@ResponseBody
	public SystemReturnResult updateBookById(Long bookId) {
		//int flag = itemService.deleteBookById(bookId);
		int flag = itemService.updateBookById(bookId,null);
		return new SystemReturnResult(flag);
	}
	@RequestMapping("/updateBooksById")
	@ResponseBody
	public SystemReturnResult updateBooksByIdsOK(@RequestParam("bookIds")Long []bookIds) {
		//int flag = itemService.deleteBooksByIdsOK(bookIds);
		int flag = itemService.updateBookByIds(bookIds);
		return new SystemReturnResult(flag);
	}
	@RequestMapping("/save")
	//添加一个itemParams参数接收规格参数的数据。
	public String addItem(TbItem item, String desc, String itemParams,HttpServletRequest request) {
		TbItemDesc itemDesc = new TbItemDesc();
		itemDesc.setItemDesc(desc);
		User user = (User)request.getSession().getAttribute("user");
		Long userId = null;
		if(user != null){
			userId = user.getId();
		}else{
			return "404";
		}
		SystemReturnResult result = itemService.addItem(item, itemDesc, itemParams,userId);
		return "redirect:bookManage.do";
	}
	@RequestMapping("/selectBookByCatId")
	@ResponseBody
	private SystemReturnResult selectBookByCatId(@RequestParam(defaultValue="1") Integer page, 
								@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request) {
		String catId = StringUtil.dnvString(request.getParameter("catId"));
		String pageNum = StringUtil.dnvString(request.getParameter("pageNum"));
		String search = StringUtil.dnvString(request.getParameter("search"));
		Long catIdLong = null;
		if(catId.length()>0){
			catIdLong = Long.parseLong(catId);
		}
		List<TbItem> items = itemService.selectBookByCatId(catIdLong,Integer.parseInt(pageNum),search);
		return new SystemReturnResult(items);
	}
	@RequestMapping("/getAllItemBtCatIdCount")
	@ResponseBody
	private SystemReturnResult getAllItemBtCatIdCount(@RequestParam(defaultValue="1") Integer page, 
								@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request) {
		String catId = StringUtil.dnvString(request.getParameter("catId"));
		String search = StringUtil.dnvString(request.getParameter("search"));
		Long catIdLong = null;
		if(catId.length()>0){
			catIdLong = Long.parseLong(catId);
		}
		int counts = itemService.getAllItemBtCatIdCount(catIdLong,search);
		return new SystemReturnResult(counts);
	}
	@RequestMapping("/selectBookByItemId")
	@ResponseBody
	private SystemReturnResult selectBookByItemId(@RequestParam(defaultValue="1") Integer page, 
								@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request) {
		String itemId = StringUtil.dnvString(request.getParameter("itemId"));
		List<TbItem> items = itemService.selectBookByItemId(Long.parseLong(itemId));
		return new SystemReturnResult(items);
	}
	@RequestMapping("/selectBookDetailByItemId")
	@ResponseBody
	private SystemReturnResult selectBookDetailByItemId(@RequestParam(defaultValue="1") Integer page, 
								@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request) {
		String itemId = StringUtil.dnvString(request.getParameter("itemId"));
		List<TbItemDesc> itemDescs = itemService.selectBookDetailByItemId(Long.parseLong(itemId));
		return new SystemReturnResult(itemDescs);
	}
	@RequestMapping("/addHotSearchOK")
	@ResponseBody
	private SystemReturnResult addHotSearchOK(HttpServletRequest request) {
		String bookId = StringUtil.dnvString(request.getParameter("bookId"));
		int updateBookById = itemService.updateBookById(Long.parseLong(bookId),"search");
		return new SystemReturnResult(updateBookById);
	}
	@RequestMapping("/queryHotSerarch")
	@ResponseBody
	private SystemReturnResult queryHotSerarch(HttpServletRequest request) {
		List<TbItem> list = itemService.queryHotSerarch();
		return new SystemReturnResult(list);
	}

}
