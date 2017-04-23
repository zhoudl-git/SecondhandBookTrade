package com.booktrade.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbItemMapper;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbItem;
import com.booktrade.pojo.TbItemExample;
import com.booktrade.pojo.TbItemExample.Criteria;
import com.booktrade.service.ItemService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private TbItemMapper itemMapper;
	@Override
	public TbItem getItemById(Long itemId) {
		//TbItem item = itemMapper.selectByPrimaryKey(itemId);
		TbItemExample example = new TbItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(itemId);
		List<TbItem> list = itemMapper.selectByExample(example);
		TbItem item = null;
		if (list != null && list.size() > 0) {
			item = list.get(0);
		}
		return item;
	}
	@Override
	public LigerUIDataGridResult getAllItem(Integer page, Integer rows) {
		//分页处理
		PageHelper.startPage(page, rows);
		//执行查询
		TbItemExample example = new TbItemExample();
		//添加条件
		//Criteria criteria = example.createCriteria();
		//criteria.andIdEqualTo(123l);
		List<TbItem> list = itemMapper.selectByExample(example);
		//取total
		PageInfo<TbItem> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		
		//创建返回值对象
		LigerUIDataGridResult result = new LigerUIDataGridResult(total, list);
		
		return result;
	}
	@Override
	public int deleteBookById(Long bookId) {
		int flag = itemMapper.deleteByPrimaryKey(bookId);
		return flag;
	}
	@Override
	public int deleteBooksByIdsOK(Long[] bookIds) {
		int flag = itemMapper.deletesByPrimaryKey(bookIds);
		return flag;
	}


}
