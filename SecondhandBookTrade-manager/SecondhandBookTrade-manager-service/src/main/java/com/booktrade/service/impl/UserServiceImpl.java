package com.booktrade.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbRoleMapper;
import com.booktrade.dao.TbUserRoleMapper;
import com.booktrade.dao.UserMapper;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbRole;
import com.booktrade.pojo.TbRoleExample;
import com.booktrade.pojo.TbUserRole;
import com.booktrade.pojo.TbUserRoleExample;
import com.booktrade.pojo.TbUserRoleExample.Criteria;
import com.booktrade.pojo.User;
import com.booktrade.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired 
	private TbUserRoleMapper userRoleMapper;
	@Autowired
	private TbRoleMapper roleMapper;
	@Override
	public User getUserById(Long userId) {
		User user = userMapper.getUserById(userId);
		return user;
	}
	@Override
	public LigerUIDataGridResult getAllUser(Integer page, Integer rows) {
		//分页处理
		PageHelper.startPage(page, rows);
		//执行查询
		//添加条件
		//Criteria criteria = example.createCriteria();
		//criteria.and;
		//List<TbUser> list = userMapper.selectByExample(example);
		List<User> list = userMapper.getAllUser();
		//取total
		PageInfo<User> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		
		//创建返回值对象
		LigerUIDataGridResult result = new LigerUIDataGridResult(total, list);
		return result;
	}
	@Override
	public Integer updateUser(Map<String, Object> map) {
		int status = userMapper.updateUser(map);
		return status;
	}
	@Override
	public Integer deleteUser(Map<String,String> map) {
		int status = userMapper.deleteUser(map);
		return status;
	}
	@Override
	public Integer addUser(Map<String, Object> map) {
		int status = userMapper.addUser(map);
		return status;
	}
	@Override
	public Integer deleteUserByIds(Long[] userIds) {
		int status = userMapper.deleteUserByIds(userIds);
		return status;
	}
	@Override
	public User login(Map<String, String> map) {
		User user = userMapper.login(map);
		return user;
	}
	@Override
	public List<TbUserRole> selectRoleByUserId(Long userId) {
		TbUserRoleExample example = new TbUserRoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		List<TbUserRole> userRole = userRoleMapper.selectByExample(example);
		return userRole;
	}
	@Override
	public TbRole setRole(Map<String, Object> map) {
		return null;
	}
	@Override
	public List<TbRole> getAllRole() {
		TbRoleExample example = new TbRoleExample();
		List<TbRole> roles = roleMapper.selectByExample(example);
		return roles;
	}
	@Override
	public TbUserRole setRole(Long userId,Long roleId) {
		TbUserRoleExample example = new TbUserRoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		criteria.andRoleIdEqualTo(roleId);
		TbUserRole tbUserRole = null;
		List<TbUserRole> userRoles = userRoleMapper.selectByExample(example);
		if(userRoles != null && userRoles.size() > 0){
			tbUserRole = userRoles.get(0);
		}
		return tbUserRole;
	}
	@Override
	public int addUserRole(TbUserRole userRole) {
		int status = userRoleMapper.insert(userRole);
		return status;
	}
	@Override
	public int deleteRoleByUserId(Long userId) {
		TbUserRoleExample example = new TbUserRoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		int status = userRoleMapper.deleteByExample(example);
		return status;
	}
}
