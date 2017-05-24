package com.booktrade.controller;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemCode;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbFunction;
import com.booktrade.pojo.TbRole;
import com.booktrade.pojo.TbUserRole;
import com.booktrade.pojo.User;
import com.booktrade.service.FunctionService;
import com.booktrade.service.UserService;
import com.booktrade.utils.CookieUtils;
import com.booktrade.utils.StringUtil;

/**   
 * @ClassName:  UserController   
 * @Description: 用户管理   
 * @author: zhoudl  
 * @date:   2017年4月8日 上午11:06:43   
 *      
 */  
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private FunctionService functionService;
	@RequestMapping("/{itemId}")
	@ResponseBody
	private User getItemById(@PathVariable Long userId) {
		User item = userService.getUserById(userId);
		return item;
	}
	
	@RequestMapping("/list")
	@ResponseBody
	private LigerUIDataGridResult getAllUser(@RequestParam(defaultValue="1") Integer page, 
								@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request) {
		
		LigerUIDataGridResult result = userService.getAllUser(page, rows);
		return result;
	}
	@RequestMapping("/addUser")
	@ResponseBody
	private String addUser(HttpServletRequest request) {
		String username = StringUtil.dnvString(request.getParameter("username"));
		String password = StringUtil.dnvString(request.getParameter("password"));
		String sex = StringUtil.dnvString(request.getParameter("sex"));
		String phone = StringUtil.dnvString(request.getParameter("phone"));
		String email = StringUtil.dnvString(request.getParameter("email"));
		String birthday = StringUtil.dnvString(request.getParameter("birthday"));
		String addressDetail = StringUtil.dnvString(request.getParameter("addressDetail"));
		String role = StringUtil.dnvString(request.getParameter("role"));
		String write = StringUtil.dnvString(request.getParameter("write"));
		String read = StringUtil.dnvString(request.getParameter("read"));
		String game = StringUtil.dnvString(request.getParameter("game"));
		String other = StringUtil.dnvString(request.getParameter("other"));
		String identity = StringUtil.dnvString(request.getParameter("identity"));
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("username", username);
		map.put("password", password);
		map.put("sex", sex);
		map.put("phone", phone);
		map.put("email", email);
		map.put("birthday", birthday);
		map.put("addressDetail", addressDetail);
		map.put("role", SystemCode.defaultUserRole);
		if("on".equals(write)){
			write = "写作";
		}
		if("on".equals(read)){
			read = "读书";
		}
		if("on".equals(game)){
			game = "游戏";
		}
		if("on".equals(other)){
			other = "其它";
		}
		map.put("interest", write +","+read+","+game+","+other);
		map.put("identity", identity);
		map.put("status", SystemCode.userShow);
		Date nowDate = new Date();
		map.put("created", nowDate);
		map.put("updated", nowDate);
		Integer status = userService.addUser(map);
		return "return";
	}
	@RequestMapping("/deleteUserById")
	@ResponseBody
	public SystemReturnResult deleteUserById(Long userId) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("status", SystemCode.userDisable);
		map.put("id", StringUtil.dnvString(userId));
		Integer status = userService.deleteUser(map);
		return new SystemReturnResult(status);
	}
	@RequestMapping("/updateUserById")
	@ResponseBody
	public SystemReturnResult deleteUserById2(Long userId) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("status", SystemCode.userShow);
		map.put("id", StringUtil.dnvString(userId));
		Integer status = userService.deleteUser(map);
		return new SystemReturnResult(status);
	}
	
	@RequestMapping("/deleteUsersById")
	@ResponseBody
	public SystemReturnResult deleteUsersById(HttpServletRequest request,@RequestParam("userIds")Long []userIds) {
		Integer flag = userService.deleteUserByIds(userIds);
		return new SystemReturnResult(flag);
	}
	@RequestMapping("/login")
	@ResponseBody
	public SystemReturnResult login(HttpServletRequest request,HttpServletResponse response) {
		String username = StringUtil.dnvString(request.getParameter("username"));
		String password = StringUtil.dnvString((request.getParameter("password")));
		Map<String, String> map = new HashMap<String,String>();
		map.put("username", username);
		map.put("password", password);
		User user = userService.login(map);
		String url = null;
		if(user != null){
			if("1".equals(user.getStatus())){
				List<TbFunction> function = functionService.getAllMenu2(user.getId());
				if(function != null && function.size() > 0){
					// 获得当前用户角色
					List<TbUserRole> roleByUserId = userService.selectRoleByUserId(user.getId());
					if (roleByUserId != null && roleByUserId.size() > 0) {
						user.setRole(roleByUserId.get(0).getRoleId()+"");
					}
					url = "afterIndex";
				}else{
					url = "index";
				}
			}else{
				url = "exception";
			}
			HttpSession session = request.getSession();
			// 使用session记录用户登录信息
			session.setAttribute("user", user);
			session.setAttribute("userName", user.getUsername());
			// 使用cookie记录用户登录ID
			CookieUtils.setCookie(request, response, "bookTradeuser", user.getId()+"");
		}else{
			url = "/";
		}
		return new SystemReturnResult(url);
	}
	@RequestMapping("/selectRole")
	@ResponseBody
	public SystemReturnResult selectRole(Long userId) {
		List<TbRole> roles = userService.getAllRole();
		return new SystemReturnResult(roles);
	}
	@RequestMapping("/setRoleByUser")
	@ResponseBody
	public SystemReturnResult setRoleByUser(HttpServletRequest request) {
		String userId = StringUtil.dnvString(request.getParameter("userId"));
		String roleId = StringUtil.dnvString(request.getParameter("roleId"));
		// 查询该用户是否已经分配该角色
		TbUserRole userRole = userService.setRole(Long.parseLong(userId), Long.parseLong(roleId));
		int status = 0;
		if(userRole == null){// 未分配该角色
			// 删除用户之前的角色
			int flag = 1;
					userService.deleteRoleByUserId(Long.parseLong(userId));
			if(flag == 1){
				TbUserRole newUserRole = new TbUserRole();
				newUserRole.setRoleId(Long.parseLong(roleId));
				newUserRole.setUserId(Long.parseLong(userId));
				Date date = new Date();
				newUserRole.setCreated(date);
				newUserRole.setUpdated(date);
				status = userService.addUserRole(newUserRole);
			}else{
				status = Integer.parseInt(SystemCode.alreadyRole);// 删除之前角色失败
			}
		}else{
			status = Integer.parseInt(SystemCode.alreadyRole);// 用户已经授予了该角色
		}
		return new SystemReturnResult(status);
	}
	/*@RequestMapping("/updateUserById")
	@ResponseBody
	public SystemReturnResult updateUserById(Long userId) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("status", SystemCode.userDisable);
		map.put("id", StringUtil.dnvString(userId));
		Integer status = userService.updateUser(map);
		return new SystemReturnResult(status);
	}*/
	/*@RequestMapping("/updateBooksById")
	@ResponseBody
	public SystemReturnResult updateBooksByIdsOK(@RequestParam("bookIds")Long []bookIds) {
		//int flag = userService.deleteBooksByIdsOK(bookIds);
		int flag = userService.updateBookByIds(bookIds);
		return new SystemReturnResult(flag);
	}*/
}
