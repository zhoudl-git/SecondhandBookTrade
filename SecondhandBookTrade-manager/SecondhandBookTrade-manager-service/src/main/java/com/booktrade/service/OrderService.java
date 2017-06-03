package com.booktrade.service;

import java.util.List;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbOrder;

public interface OrderService {
	int addOrder(TbOrder order);
	List<TbOrder> queryOrder(Long userId);
	LigerUIDataGridResult getAllOrder(Integer page, Integer rows);
}
