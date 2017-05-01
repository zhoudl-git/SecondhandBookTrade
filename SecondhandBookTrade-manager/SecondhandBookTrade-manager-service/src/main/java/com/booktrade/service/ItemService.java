package com.booktrade.service;


import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbItem;
import com.booktrade.pojo.TbItemDesc;

public interface ItemService {
	TbItem getItemById(Long itemId);
	LigerUIDataGridResult getAllItem(Integer page,Integer rows);
	int deleteBookById(Long bookId);
	int deleteBooksByIdsOK(Long [] bookIds);
	SystemReturnResult addItem(TbItem item, TbItemDesc itemDesc, String itemParams);
}
