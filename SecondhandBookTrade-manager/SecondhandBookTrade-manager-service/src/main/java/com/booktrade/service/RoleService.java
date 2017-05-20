package com.booktrade.service;



import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbRole;

public interface RoleService {
	int deleteRoleById(Long id);
	int addRole(TbRole role);
	LigerUIDataGridResult getAllRole(Integer page, Integer rows);
	int updateRoleById(TbRole role);
	int deleteRoleByIds(Long [] ids);
}
