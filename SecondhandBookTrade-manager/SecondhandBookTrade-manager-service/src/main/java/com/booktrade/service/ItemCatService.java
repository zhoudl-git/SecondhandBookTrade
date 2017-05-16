package com.booktrade.service;

import java.util.List;

import com.booktrade.pojo.TbItemCat;
import com.booktrade.pojo.TreeNode;

public interface ItemCatService {
	
	List<TreeNode> getItemCatList(long parentId);
	int deleteById(List<Long> ids);
	int updateById(TbItemCat itemCat);
	TbItemCat selectById(Long id);
	int insertItemCat(TbItemCat itemCat);
}
