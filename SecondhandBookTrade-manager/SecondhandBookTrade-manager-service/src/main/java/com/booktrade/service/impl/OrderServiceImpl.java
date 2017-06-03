package com.booktrade.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbOrderMapper;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbOrder;
import com.booktrade.pojo.TbOrderExample;
import com.booktrade.pojo.User;
import com.booktrade.pojo.TbOrderExample.Criteria;
import com.booktrade.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private TbOrderMapper orderMapper;
	@Override
	public int addOrder(TbOrder order) {
		int status = orderMapper.insert(order);
		return status;
	}

	@Override
	public List<TbOrder> queryOrder(Long userId) {
		TbOrderExample example = new TbOrderExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		List<TbOrder> ordrs = orderMapper.selectByExample(example);
		return ordrs;
	}

	@Override
	public LigerUIDataGridResult getAllOrder(Integer page, Integer rows) {
		//分页处理
		PageHelper.startPage(page, rows);
		//执行查询
		//添加条件
		//Criteria criteria = example.createCriteria();
		//criteria.and;
		//List<TbUser> list = userMapper.selectByExample(example);
		TbOrderExample example = new TbOrderExample();
		List<TbOrder> list = orderMapper.selectByExample(example);
		//取total
		PageInfo<TbOrder> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		//创建返回值对象
		LigerUIDataGridResult result = new LigerUIDataGridResult(total, list);
		return result;
	}

}
