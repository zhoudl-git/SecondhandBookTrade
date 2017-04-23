package com.booktrade.service;


import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbItem;

public interface ItemService {
	TbItem getItemById(Long itemId);
	LigerUIDataGridResult getAllItem(Integer page,Integer rows);
	int deleteBookById(Long bookId);
	int deleteBooksByIdsOK(Long [] bookIds);
}
