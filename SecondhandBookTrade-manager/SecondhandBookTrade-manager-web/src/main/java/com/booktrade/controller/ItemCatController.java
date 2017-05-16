package com.booktrade.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbItemCat;
import com.booktrade.pojo.TreeNode;
import com.booktrade.service.ItemCatService;
import com.booktrade.utils.StringUtil;


/**   
 * @ClassName:  ItemCatController   
 * @Description:书籍分类类目管理   
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
	
	@RequestMapping(value="/deleteById")
	@ResponseBody
	public SystemReturnResult deleteById(@RequestParam("tempIds")List<Long> tempIds) {
		int flag = itemCatService.deleteById(tempIds);
		if(flag != 0){
			return new SystemReturnResult(200, "删除成功", flag);
		}else{
			return new SystemReturnResult(200, "删除失败", flag);
		}
	}
	
	@RequestMapping(value="/updateById")
	@ResponseBody
	public SystemReturnResult updateById(HttpServletRequest request) {
		String id = request.getParameter("id");
		TbItemCat itemCat = itemCatService.selectById(Long.parseLong(id));
		// 要修改的名称
		String nodeName = request.getParameter("name");
		if(itemCat != null){
			//if(nodeName != null && nodeName.length() > 0){
			itemCat.setName(StringUtil.dnvString(nodeName));
			Date date = new Date();
			itemCat.setUpdated(date);
			System.out.println(StringUtil.dnvString(nodeName));
			//}else{
				//return new SystemReturnResult(200, "类目名称为空", 0);
			//}
		}else{
			return new SystemReturnResult(200, "数据库中不存在该对象，修改失败", 0);
		}
		int flag = itemCatService.updateById(itemCat);
		if(flag != 0){
			return new SystemReturnResult(200, "修改成功", flag);
		}else{
			return new SystemReturnResult(200, "修改失败", flag);
		}
	}
	@RequestMapping(value="/addTreeNode")
	@ResponseBody
	public SystemReturnResult addTreeNode(HttpServletRequest request) {
		TbItemCat itemCat = new TbItemCat();
		String name = request.getParameter("name");
		String parentId = request.getParameter("parentId");
		/*String isParent = request.getParameter("isParent");*/
		/*String status = request.getParameter("status");
		String sortOrder = request.getParameter("sortOrder");
		String isParent = request.getParameter("isParent");*/
		itemCat.setName(StringUtil.dnvString(name));
		itemCat.setParentId(Long.parseLong(StringUtil.dnvString(parentId)));
		// 设置默认不是父节点
		itemCat.setIsParent(false);
		// created updated
		Date date = new Date();
		itemCat.setCreated(date);
		itemCat.setUpdated(date);
		// 需要修改当前新节点父节点的isParent字段值
		TbItemCat itemCatParent = itemCatService.selectById(Long.parseLong(parentId));
		if(itemCatParent != null){
			itemCatParent.setIsParent(true);
			int updateById = itemCatService.updateById(itemCatParent);
			if(updateById == 1){
				int flag = itemCatService.insertItemCat(itemCat);
				if(flag == 1){
					return new SystemReturnResult(200,"新增成功",flag);
				}else{
					return new SystemReturnResult(200,"新增失败",flag);
				}
			}else{
				return new SystemReturnResult(200,"修改父节点数据失败",0);
			}
		}else{
			return new SystemReturnResult(200,"当前选中的父节点在数据库中不存在",0);
		}
	}
	
}
