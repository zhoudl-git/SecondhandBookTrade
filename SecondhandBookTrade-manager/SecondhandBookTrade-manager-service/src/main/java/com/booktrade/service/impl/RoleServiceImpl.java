package com.booktrade.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbRoleMapper;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbRole;
import com.booktrade.pojo.TbRoleExample;
import com.booktrade.pojo.TbRoleExample.Criteria;
import com.booktrade.service.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private TbRoleMapper roleMapper;

	@Override
	public int deleteRoleById(Long id) {
		int status = roleMapper.deleteByPrimaryKey(id);
		return status;
	}

	@Override
	public int addRole(TbRole role) {
		int status = roleMapper.insert(role);
		return status;
	}

	@Override
	public LigerUIDataGridResult getAllRole(Integer page, Integer rows) {
		//分页处理
		PageHelper.startPage(page, rows);
		//执行查询
		//添加条件
		//Criteria criteria = example.createCriteria();
		//criteria.and;
		//List<TbUser> list = userMapper.selectByExample(example);
		TbRoleExample example = new TbRoleExample();
		List<TbRole> list = roleMapper.selectByExample(example);
		//取total
		PageInfo<TbRole> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		
		//创建返回值对象
		LigerUIDataGridResult result = new LigerUIDataGridResult(total, list);
		return result;
	}

	@Override
	public int updateRoleById(TbRole role) {
		return 0;
	}

	@Override
	public int deleteRoleByIds(Long[] ids) {
		int flag = roleMapper.deleteRoleByIds(ids);
		return flag;
	}

	
}
