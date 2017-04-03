package com.booktrade.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.booktrade.pojo.TbItem;
import com.booktrade.service.ItemService;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/item/{itemId}")
	@ResponseBody
	private TbItem getItemById(@PathVariable Long itemId) {
		TbItem item = itemService.getItemById(itemId);
		return item;
	}
	@RequestMapping("/items")
	@ResponseBody
	private String getItemByIdTO(@PathVariable Long itemId) {
		
		return "index";
	}
	
	@RequestMapping("/test")
	@ResponseBody
	private ModelAndView test() {
		ModelAndView view = new ModelAndView("index");
		return view;
	}

}
