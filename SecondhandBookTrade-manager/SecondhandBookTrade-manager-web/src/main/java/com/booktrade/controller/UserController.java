package com.booktrade.controller;



import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.booktrade.utils.StringUtil;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemCode;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.User;
import com.booktrade.service.UserService;

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
	private SystemReturnResult addUser(HttpServletRequest request) {
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
		map.put("role", role);
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
		return new SystemReturnResult(status);
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
