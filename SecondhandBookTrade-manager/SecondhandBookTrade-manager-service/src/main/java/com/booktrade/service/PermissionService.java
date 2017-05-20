package com.booktrade.service;

import java.util.List;

import com.booktrade.pojo.TbRoleFunction;

public interface PermissionService {
	public int setPermission(TbRoleFunction roleFunction);
	public int getPermission(Long functionId,Long roleId);
	public List<TbRoleFunction> selectRoleFunction(Long roleId,Long functionId);
}
