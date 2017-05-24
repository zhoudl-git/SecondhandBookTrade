package com.booktrade.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbItemCatMapper;
import com.booktrade.pojo.TbItemCat;
import com.booktrade.pojo.TbItemCatExample;
import com.booktrade.pojo.TbItemCatExample.Criteria;
import com.booktrade.pojo.TreeNode;
import com.booktrade.service.ItemCatService;

/**   
 * @ClassName:  ItemCatServiceImpl   
 * @Description:书籍分类   
 * @author: zhoudl  
 * @date:   2017年4月9日 下午6:05:20   
 *      
 */  
@Service
public class ItemCatServiceImpl implements ItemCatService {

	@Autowired
	private TbItemCatMapper itemCatMapper;
	
	@Override
	public List<TreeNode> getItemCatList(long parentId) {
		//根据parentId查询分类列表
		TbItemCatExample example = new TbItemCatExample();
		//设置查询条件
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		//执行查询
		List<TbItemCat> list = itemCatMapper.selectByExample(example);
		//分类列表转换成TreeNode的列表
		List<TreeNode> resultList = new ArrayList<>();
		for (TbItemCat tbItemCat : list) {
			//创建一个TreeNode对象
			TreeNode node = new TreeNode(tbItemCat.getId(), tbItemCat.getName(), 
					tbItemCat.getIsParent()?"closed":"open");
			resultList.add(node);
		}
		
		return resultList;
	}

	@Override
	public int deleteById(List<Long> ids) {
		TbItemCatExample example = new TbItemCatExample();
		//设置条件
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(ids);
		int flag = itemCatMapper.deleteByExample(example);
		return flag;
	}

	@Override
	public int updateById(TbItemCat itemCat) {
		int flag = itemCatMapper.updateByPrimaryKey(itemCat);
		return flag;
	}

	@Override
	public TbItemCat selectById(Long id) {
		TbItemCat itemCat = itemCatMapper.selectByPrimaryKey(id);
		return itemCat;
	}

	@Override
	public int insertItemCat(TbItemCat itemCat) {
		int flag = itemCatMapper.insert(itemCat);
		return flag;
	}

	@Override
	public List<TbItemCat> getAllItemCat() {
		TbItemCatExample example = new TbItemCatExample();
		List<TbItemCat> itemCats = itemCatMapper.selectByExample(example);
		return itemCats;
	}

}
