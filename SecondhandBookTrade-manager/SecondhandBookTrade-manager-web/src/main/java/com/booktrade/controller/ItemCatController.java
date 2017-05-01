package com.booktrade.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TreeNode;
import com.booktrade.service.ItemCatService;


/**   
 * @ClassName:  ItemCatController   
 * @Description:书籍分类管理   
 * @author: zhoudl  
 * @date:   2017年4月9日 下午6:06:29   
 *      
 */  
@Controller
@RequestMapping("/item/cat")
public class ItemCatController {

	@Autowired
	private ItemCatService itemCatService;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<TreeNode> getItemCatList(@RequestParam(value="id", defaultValue="0")Long parentId) {
		List<TreeNode> list = itemCatService.getItemCatList(parentId);
		return list;
	}
	
}
