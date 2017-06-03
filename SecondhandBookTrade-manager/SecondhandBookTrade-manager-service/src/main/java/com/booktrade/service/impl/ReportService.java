package com.booktrade.service.impl;

import java.util.List;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbReport;

public interface ReportService {
	int addReport(TbReport report);
	int deleteReport(Long reportId);
	LigerUIDataGridResult getAllReport(Integer page, Integer rows);
	List<TbReport> queryAllReport(Integer status);
	int deleteReports(List<Long> list);
}
