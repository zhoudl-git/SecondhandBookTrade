package com.booktrade.service;

import java.util.List;
import com.booktrade.pojo.TreeNode;

public interface ItemCatService {
	
	List<TreeNode> getItemCatList(long parentId);
}
