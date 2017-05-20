package com.booktrade.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbRoleFunctionMapper;
import com.booktrade.pojo.TbRoleFunction;
import com.booktrade.pojo.TbRoleFunctionExample;
import com.booktrade.pojo.TbRoleFunctionExample.Criteria;
import com.booktrade.service.PermissionService;
@Service
public class PermissionServiceImpl implements PermissionService {
	@Autowired
	private TbRoleFunctionMapper roleFunctionMapper;
	@Override
	public int setPermission(TbRoleFunction roleFunction) {
		int status = roleFunctionMapper.insert(roleFunction);
		return status;
	}

	@Override
	public int getPermission(Long functionId,Long roleId) {
		TbRoleFunctionExample example = new TbRoleFunctionExample();
		Criteria criteria = example.createCriteria();
		criteria.andFunctionIdEqualTo(functionId);
		criteria.andRoleIdEqualTo(roleId);
		int flag = roleFunctionMapper.deleteByExample(example);
		return flag;
	}

	@Override
	public List<TbRoleFunction> selectRoleFunction(Long roleId, Long functionId) {
		TbRoleFunctionExample example = new TbRoleFunctionExample();
		Criteria criteria = example.createCriteria();
		criteria.andFunctionIdEqualTo(functionId);
		criteria.andRoleIdEqualTo(roleId);
		List<TbRoleFunction> roleFunctions = roleFunctionMapper.selectByExample(example);
		return roleFunctions;
	}

}
