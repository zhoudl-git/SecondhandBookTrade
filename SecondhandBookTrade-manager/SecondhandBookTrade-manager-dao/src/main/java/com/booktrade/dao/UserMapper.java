package com.booktrade.dao;

import java.util.List;
import java.util.Map;

import com.booktrade.pojo.User;

public interface UserMapper {
	public List<User> getAllUser();
	public User getUserById(Long userId);
	public int deleteUser(Map<String, String> map);
	public int updateUser(Map<String, Object> map);
	public int addUser(Map<String, Object> map);
	public int deleteUserByIds(Long [] userIds);
	public User login(Map<String, String> map);
}
