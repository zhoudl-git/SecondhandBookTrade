package com.booktrade.service;


import java.util.List;
import java.util.Map;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbRole;
import com.booktrade.pojo.TbUserRole;
import com.booktrade.pojo.User;

public interface UserService {
	/*TbUser getUserById(Long itemId);
	LigerUIDataGridResult getAllUser(Integer page,Integer rows);
	Integer updateUser(Map<String,Object> map);
	Integer deleteUser(Long userId);*/
	User getUserById(Long itemId);
	LigerUIDataGridResult getAllUser(Integer page, Integer rows);
	Integer updateUser(Map<String,Object> map);
	Integer deleteUser(Map<String,String> map);
	Integer deleteUserByIds(Long [] userIds);
	Integer addUser(Map<String,Object> map);
	User login(Map<String,String> map);
	List<TbUserRole> selectRoleByUserId(Long userId);
	TbRole setRole(Map<String,Object> map);
	TbUserRole setRole(Long userId,Long roleId);
	List<TbRole> getAllRole();
	int addUserRole(TbUserRole userRole);
	int deleteRoleByUserId(Long userId);
	/*int deleteBookById(Long bookId);
	int deleteBooksByIdsOK(Long [] bookIds);
	SystemReturnResult addItem(TbItem item, TbItemDesc itemDesc, String itemParams);
	int updateBookById(Long bookId,String status);
	int updateBookByIds(Long [] bookIds);
	int updateBookByIds2(Long [] bookIds);*/
}
