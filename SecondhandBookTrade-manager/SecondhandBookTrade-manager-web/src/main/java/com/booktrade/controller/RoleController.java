package com.booktrade.controller;



import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbRole;
import com.booktrade.service.RoleService;
import com.booktrade.utils.StringUtil;

/**   
 * @ClassName:  RoleController   
 * @Description: 角色管理   
 * @author: zhoudl  
 * @date:   2017年4月8日 上午11:06:43   
 *      
 */  
@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	
	@RequestMapping("/list")
	@ResponseBody
	private LigerUIDataGridResult getAllUser(@RequestParam(defaultValue="1") Integer page, 
								@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request) {
		
		LigerUIDataGridResult result = roleService.getAllRole(page, rows);
		return result;
	}
	@RequestMapping("/addRole")
	@ResponseBody
	private SystemReturnResult addRole(HttpServletRequest request) {
		String name = StringUtil.dnvString(request.getParameter("name"));
		TbRole role = new TbRole();
		role.setName(name);
		Date date = new Date();
		role.setName(name);
		role.setCreated(date);
		role.setUpdated(date);
		int status = roleService.addRole(role);
		return new SystemReturnResult(status);
	}
	@RequestMapping("/deleteRoleById")
	@ResponseBody
	private SystemReturnResult deleteRoleById(HttpServletRequest request) {
		String id = StringUtil.dnvString(request.getParameter("id"));
		int status = roleService.deleteRoleById(Long.parseLong(id));
		return new SystemReturnResult(status);
	}
	@RequestMapping("/deleteRolesById")
	@ResponseBody
	public SystemReturnResult deleteUsersById(HttpServletRequest request,@RequestParam("roleIds")Long []roleIds) {
		Integer flag = roleService.deleteRoleByIds(roleIds);
		return new SystemReturnResult(flag);
	}
}
