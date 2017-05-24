package com.booktrade.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbItemDescMapper;
import com.booktrade.dao.TbItemMapper;
import com.booktrade.dao.TbItemParamItemMapper;
import com.booktrade.dao.UserMapper;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemCode;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbItem;
import com.booktrade.pojo.TbItemDesc;
import com.booktrade.pojo.TbItemDescExample;
import com.booktrade.pojo.TbItemExample;
import com.booktrade.pojo.TbItemExample.Criteria;
import com.booktrade.pojo.TbItemParamItem;
import com.booktrade.pojo.User;
import com.booktrade.service.ItemService;
import com.booktrade.utils.ExceptionUtil;
import com.booktrade.utils.IDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private TbItemMapper itemMapper;
	
	@Autowired
	TbItemDescMapper itemDescMapper;
	
	@Autowired
	UserMapper userMapper;
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
		//criteria.and;
		List<TbItem> list = itemMapper.selectByExample(example);
		for(int i=0;i<list.size();i++){
			User userById = userMapper.getUserById(list.get(i).getUploadId());
			list.get(i).setUserName(userById.getUsername());
		}
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
	@Override
	public SystemReturnResult addItem(TbItem item, TbItemDesc itemDesc, String itemParams,Long userId) {
		try {
			//生成书籍id
			//可以使用redis的自增长key，在没有redis之前使用时间+随机数策略生成
			Long itemId = IDUtils.genItemId();
			//补全不完整的字段
			item.setId(itemId);
			item.setStatus((byte) 1);
			item.setUploadId(userId);
			Date date = new Date();
			item.setCreated(date);
			item.setUpdated(date);
			//把数据插入到书籍表
			itemMapper.insert(item);
			//添加书籍描述
			itemDesc.setItemId(itemId);
			itemDesc.setCreated(date);
			itemDesc.setUpdated(date);
			//把数据插入到书籍描述表
			itemDescMapper.insert(itemDesc);
			
			//把书籍的规格参数插入到tb_item_param_item中
			TbItemParamItem itemParamItem = new TbItemParamItem();
			/*itemParamItem.setItemId(itemId);
			itemParamItem.setParamData(itemParams);
			itemParamItem.setCreated(date);
			itemParamItem.setUpdated(date);
			itemParamItemMapper.insert(itemParamItem);*/
			
		} catch (Exception e) {
			e.printStackTrace();
			return SystemReturnResult.build(500, ExceptionUtil.getStackTrace(e));
		}
		
		return SystemReturnResult.ok();
	}
	@Override
	public int updateBookById(Long bookId,String status) {
		TbItem record = itemMapper.selectByPrimaryKey(bookId);
		record.setId(bookId);
		if("end".equals(status)){
			record.setStatus(new Byte((byte) 0));
		}else if("search".equals(status)){
			record.setStatus(new Byte((byte) 2));
		}else{
			record.setStatus(new Byte((byte) 1));
		}
		int flag = itemMapper.updateByPrimaryKey(record);
		return flag;
	}
	@Override
	public int updateBookByIds(Long[] bookIds) {
		int flag = itemMapper.updateByBookIds(bookIds);
		return flag;
	}
	@Override
	public int updateBookByIds2(Long[] bookIds) {
		int flag = itemMapper.updateByBookIds(bookIds);
		return flag;
	}
	@Override
	public List<TbItem> selectBookByCatId(Long catId,Integer pageNum,String search) {
		/*TbItemExample example = new TbItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andCidEqualTo(catId);
		criteria.andStatusEqualTo(SystemCode.bookStatus);
		List<TbItem> items = itemMapper.selectByExample(example);*/
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("cid", catId);
		map.put("pageNum", (pageNum-1)*SystemCode.dataByPage);
		map.put("pageStop", SystemCode.dataByPage);
		map.put("status",SystemCode.bookStatus);
		if(search.length()>0){
			map.put("search", search);
		}
		List<TbItem> itemByPage = itemMapper.getItemByPage(map);
		return itemByPage;
	}
	@Override
	public List<TbItem> selectBookByItemId(Long itemId) {
		TbItemExample example = new TbItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(itemId);
		List<TbItem> items = itemMapper.selectByExample(example);
		return items;
	}
	@Override
	public List<TbItemDesc> selectBookDetailByItemId(Long itemId) {
		TbItemDescExample example = new TbItemDescExample();
		com.booktrade.pojo.TbItemDescExample.Criteria criteria = example.createCriteria();
		criteria.andItemIdEqualTo(itemId);
		List<TbItemDesc> itemDescs = itemDescMapper.selectByExampleWithBLOBs(example);
		//List<TbItemDesc> itemDescs = itemDescMapper.selectByExample(example);
		return itemDescs;
	}
	@Override
	public int getAllItemBtCatIdCount(Long catId,String search) {
		TbItemExample example = new TbItemExample();
		Criteria criteria = example.createCriteria();
		if(catId != null){
			criteria.andCidEqualTo(catId);
		}
		if(search.length()>0){
			criteria.andTitleLike(search);
		}
		criteria.andStatusEqualTo(SystemCode.bookStatus);
		int counts = itemMapper.countByExample(example);
		//TbItemDescExample descExample = new TbItemDescExample();
		//com.booktrade.pojo.TbItemDescExample.Criteria descCriteria = descExample.createCriteria();
		//descCriteria.and
		//itemDescMapper.selectByExampleWithBLOBs(descExample);
		return counts;
	}
	@Override
	public List<TbItem> queryHotSerarch() {
		TbItemExample example = new TbItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(new Byte((byte) 2));
		List<TbItem> list = itemMapper.selectByExample(example);
		return list;
	}
}
