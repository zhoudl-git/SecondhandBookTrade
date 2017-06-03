package com.booktrade.service;

import java.util.List;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbMessage;
import com.booktrade.pojo.TbReport;

public interface MessageService {
	int addReport(TbMessage report);
	int deleteReport(Long reportId);
	//LigerUIDataGridResult getAllReport(Integer page, Integer rows);
	List<TbMessage> queryAllReport(Long itemId,Integer status);
	int deleteReports(List<Long> list);
	
}
