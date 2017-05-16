package com.booktrade.service;


import java.util.Map;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.User;

public interface UserService {
	/*TbUser getUserById(Long itemId);
	LigerUIDataGridResult getAllUser(Integer page,Integer rows);
	Integer updateUser(Map<String,Object> map);
	Integer deleteUser(Long userId);*/
	User getUserById(Long itemId);
	LigerUIDataGridResult getAllUser(Integer page, Integer rows);
	Integer updateUser(Map<String,Object> map);
	Integer deleteUser(Long userId);
	Integer addUser(Map<String,Object> map);
	/*int deleteBookById(Long bookId);
	int deleteBooksByIdsOK(Long [] bookIds);
	SystemReturnResult addItem(TbItem item, TbItemDesc itemDesc, String itemParams);
	int updateBookById(Long bookId,String status);
	int updateBookByIds(Long [] bookIds);
	int updateBookByIds2(Long [] bookIds);*/
}
