package com.booktrade.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.UserMapper;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.User;
import com.booktrade.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
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
		
		return null;
	}
	@Override
	public Integer deleteUser(Long userId) {
		return null;
	}
	@Override
	public Integer addUser(Map<String, Object> map) {
		int status = userMapper.addUser(map);
		return status;
	}
}
