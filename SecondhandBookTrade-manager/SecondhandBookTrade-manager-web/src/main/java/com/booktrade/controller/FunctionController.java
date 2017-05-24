package com.booktrade.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbFunction;
import com.booktrade.pojo.User;
import com.booktrade.service.FunctionService;
import com.booktrade.utils.StringUtil;

/**   
 * @ClassName:  FunctionController   
 * @Description: 菜单控制类
 * @author: zhoudl  
 * @date:   2017年5月16日 下午1:24:21   
 *      
 */  
@Controller
@RequestMapping("/function")
public class FunctionController {
	@Autowired
	private FunctionService functionService;
	
	@RequestMapping("/queryAllMenu")
	@ResponseBody
	public SystemReturnResult queryAllMenu(HttpServletRequest request){
		//List<TbFunction> functions = functionService.queryAllMenu();
		User user = (User)request.getSession().getAttribute("user");
		if(user == null){
			return new SystemReturnResult("index");
		}
		String userId = StringUtil.dnvString(user.getId());
		List<TbFunction> functions = functionService.getAllMenu2(Long.parseLong(userId));
		List<TbFunction> temp = new ArrayList<TbFunction>();
		for(int i=0;i<functions.size();i++){
			Long t = functions.get(i).getId();
			for(int j=0;j<functions.size();j++){
				if(!temp.contains(functions.get(i))){
					temp.add(functions.get(i));
				}
				System.out.println(functions.get(j).getParentId() +"::"+t);
				if(functions.get(j).getParentId() == t){
					temp.add(functions.get(j));
				}
			}
		}
		return new SystemReturnResult(temp);
	}
	@RequestMapping("/queryAllMenu2")
	@ResponseBody
	public SystemReturnResult queryAllMenu2(HttpServletRequest request){
		// 获取用户ID
		//List<TbFunction> functions = functionService.getAllMenu2();
		List<TbFunction> functions = functionService.queryAllMenu();
		//List<TbFunction> lstTree = new ArrayList<TbFunction>();
		
		for (TbFunction ae : functions) {
			ae.setpId(ae.getParentId()+"");
			ae.setLevel(ae.getAccordion()+"");
			ae.setOpen(true);
			ae.setUrl("");
			if(ae.getAccordion() == 2){
				ae.setIcon("");
			}else if(ae.getAccordion() == 1){
				ae.setIcon("");
			}
			//lstTree.add(ae);
		}
		return new SystemReturnResult(functions);
	}
	@RequestMapping("/saveTreeNode")
	@ResponseBody
	public SystemReturnResult addCategory(HttpServletRequest request){
		String name = StringUtil.dnvString(request.getParameter("name"));
		String level = StringUtil.dnvString(request.getParameter("level"));
		String parend = StringUtil.dnvString(request.getParameter("parent"));
		String url = StringUtil.dnvString(request.getParameter("url"));
		// level="+level+"&parent="+id+"&name="+jdname+"&isenabled=1";
		TbFunction function = new TbFunction();
		function.setName(name);
		function.setSerialNum(1);
		function.setUrl(url);
		function.setAccordion(Integer.parseInt(level));
		function.setParentId(Long.parseLong(parend));
		Date date = new Date();
		function.setCreated(date);
		function.setUpdated(date);
		int status = functionService.saveTreeNode(function);
		return new SystemReturnResult(status);
	}
	@RequestMapping("/updateMenu")
	@ResponseBody
	public SystemReturnResult updateMenu(HttpServletRequest request){
		String name = StringUtil.dnvString(request.getParameter("name"));
		/*String level = StringUtil.dnvString(request.getParameter("level"));
		String parentId = StringUtil.dnvString(request.getParameter("parentId"));*/
		String id = StringUtil.dnvString(request.getParameter("id"));
		//String url = StringUtil.dnvString(request.getParameter("url"));
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("name", name);
		int status = functionService.updateMenu(map);
		return new SystemReturnResult(status);
	}
	@RequestMapping("/deleteTreeNode")
	@ResponseBody
	public SystemReturnResult deleteTreeNode(HttpServletRequest request){
		String id = StringUtil.dnvString(request.getParameter("id"));
		int status = functionService.deleteMenu(Long.parseLong(id));
		return new SystemReturnResult(status);
	}
}
