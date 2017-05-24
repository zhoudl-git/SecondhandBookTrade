package com.booktrade.service;


import java.util.List;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbItem;
import com.booktrade.pojo.TbItemDesc;

public interface ItemService {
	TbItem getItemById(Long itemId);
	LigerUIDataGridResult getAllItem(Integer page,Integer rows);
	int deleteBookById(Long bookId);
	int deleteBooksByIdsOK(Long [] bookIds);
	SystemReturnResult addItem(TbItem item, TbItemDesc itemDesc, String itemParams,Long userId);
	int updateBookById(Long bookId,String status);
	int updateBookByIds(Long [] bookIds);
	int updateBookByIds2(Long [] bookIds);
	List<TbItem> selectBookByCatId(Long catId,Integer pageNum,String search);
	List<TbItem> selectBookByItemId(Long itemId);
	List<TbItemDesc> selectBookDetailByItemId(Long itemId);
	int getAllItemBtCatIdCount(Long catId,String search);
	List<TbItem> queryHotSerarch();
}
