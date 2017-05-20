package com.booktrade.controller;




import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.booktrade.utils.StringUtil;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbRoleFunction;
import com.booktrade.service.PermissionService;

/**   
 * @ClassName:  PermissionController   
 * @Description: 角色权限管理   
 * @author: zhoudl  
 * @date:   2017年4月8日 上午11:06:43   
 *      
 */  
@Controller
@RequestMapping("/permission")
public class PermissionController {
	
	@Autowired
	private PermissionService pService;
	@RequestMapping("/setPermission")
	@ResponseBody
	public SystemReturnResult setPermission(HttpServletRequest request,@RequestParam("roleFunIds")Long []roleFunIds) {
		String roleId = StringUtil.dnvString(request.getParameter("roleId"));
		int flag = 0;
		for (int i = 0; i < roleFunIds.length; i++) {
			List<TbRoleFunction> oldRoleFunction = pService.selectRoleFunction(Long.parseLong(roleId), roleFunIds[i]);
			if(oldRoleFunction != null && oldRoleFunction.size() != 0){
				flag = 1;
			}else{
				TbRoleFunction roleFunction = new TbRoleFunction();
				roleFunction.setRoleId(Long.parseLong(roleId));
				roleFunction.setFunctionId(roleFunIds[i]);
				roleFunction.setStatus(1);
				pService.setPermission(roleFunction);
				flag = 1;
			}
		}
		return new SystemReturnResult(flag);
	}
	@RequestMapping("/getPermission")
	@ResponseBody
	public SystemReturnResult getPermission(HttpServletRequest request,@RequestParam("roleFunIds")Long []roleFunIds) {
		String roleId = StringUtil.dnvString(request.getParameter("roleId"));
		Integer flag = 0;
		for (int i = 0; i < roleFunIds.length; i++) {
			flag = pService.getPermission(Long.parseLong(roleId), roleFunIds[i]);
		}
		return new SystemReturnResult(flag);
	}
}
