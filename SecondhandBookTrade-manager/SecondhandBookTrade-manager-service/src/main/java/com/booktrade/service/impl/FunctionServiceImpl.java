package com.booktrade.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.MenuMapper;
import com.booktrade.dao.TbFunctionMapper;
import com.booktrade.pojo.Menu;
import com.booktrade.pojo.TbFunction;
import com.booktrade.pojo.TbFunctionExample;
import com.booktrade.pojo.TbFunctionExample.Criteria;
import com.booktrade.service.FunctionService;
@Service
public class FunctionServiceImpl implements FunctionService {
	@Autowired
	private TbFunctionMapper functionMapper;
	@Autowired
	private MenuMapper menuMapper;
	@Override
	public int addMenu(Map<String, Object> map) {
		return 0;
	}

	@Override
	public int deleteMenu(Long id) {
		functionMapper.deleteByPrimaryKey(id);
		return 0;
	}

	@Override
	public int updateMenu(Map<String, Object> map) {
		int flag = functionMapper.updateTreeNode(map);
		return flag;
	}

	@Override
	public List<TbFunction> queryAllMenu() {
		TbFunctionExample example = new TbFunctionExample();
		// 增加查询条件
		List<TbFunction> functions = functionMapper.selectByExample(example);
		return functions;
	}

	@Override
	public List<TbFunction> getAllMenu2(Long userId) {
		List<TbFunction> menu = functionMapper.getAllMenu2(userId);
		return menu;
	}

	@Override
	public int saveTreeNode(TbFunction function) {
		int flag = functionMapper.insert(function);
		return flag;
	}

	@Override
	public List<Menu> getAllMenu() {
		List<Menu> menu = menuMapper.getAllMenu();
		return menu;
	}


}
