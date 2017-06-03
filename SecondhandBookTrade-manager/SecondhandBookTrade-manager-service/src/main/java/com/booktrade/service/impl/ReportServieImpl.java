package com.booktrade.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbReportMapper;
import com.booktrade.dao.UserMapper;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemCode;
import com.booktrade.pojo.TbReport;
import com.booktrade.pojo.TbReportExample;
import com.booktrade.pojo.User;
import com.booktrade.pojo.TbReportExample.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ReportServieImpl implements ReportService {
	@Autowired 
	TbReportMapper reportMapper;
	@Autowired
	UserMapper userMapper;
	@Override
	public int addReport(TbReport report) {
		int status = reportMapper.insert(report);
		return status;
	}

	@Override
	public int deleteReport(Long reportId) {
		TbReport record = new TbReport();
		record.setIsdelte(SystemCode.isDelete);// 公告删除标记
		TbReport oldReport = reportMapper.selectByPrimaryKey(reportId);
		record.setContent(oldReport.getContent());
		record.setId(oldReport.getId());
		record.setTitle(oldReport.getTitle());
		Date date = new Date();
		record.setUpdateTime(date);
		record.setCreateTime(oldReport.getCreateTime());
		record.setUserid(oldReport.getUserid());
		TbReportExample example = new TbReportExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(reportId);
		int status = reportMapper.updateByPrimaryKey(record);
		//int status = reportMapper.updateByExample(record, example);
		return status;
	}

	@Override
	public List<TbReport> queryAllReport(Integer isdelete) {
		TbReportExample example = new TbReportExample();
		Criteria criteria = example.createCriteria();
		if(isdelete != null){
			criteria.andIsdelteEqualTo(isdelete);
		}
		List<TbReport> reports = reportMapper.selectByExample(example);
		// 组合出用户名
		for(int i=0;i<reports.size();i++){
			User user = userMapper.getUserById(reports.get(i).getUserid());
			if(user != null){
				reports.get(i).setUserName(user.getUsername());
			}
		}
		return reports;
	}

	@Override
	public int deleteReports(List<Long> list) {
		TbReportExample example = new TbReportExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(list);
		int status = reportMapper.deleteByExample(example);
		return status;
	}

	@Override
	public LigerUIDataGridResult getAllReport(Integer page, Integer rows) {
		//分页处理
		PageHelper.startPage(page, rows);
		//执行查询
		//添加条件
		//Criteria criteria = example.createCriteria();
		//criteria.and;
		//List<TbUser> list = userMapper.selectByExample(example);
		TbReportExample example = new TbReportExample();
		List<TbReport> reports = reportMapper.selectByExample(example);
		// 组合出用户名
		for(int i=0;i<reports.size();i++){
			User user = userMapper.getUserById(reports.get(i).getUserid());
			if(user != null){
				reports.get(i).setUserName(user.getUsername());
			}
		}
		//取total
		PageInfo<TbReport> pageInfo = new PageInfo<>(reports);
		long total = pageInfo.getTotal();
		
		//创建返回值对象
		LigerUIDataGridResult result = new LigerUIDataGridResult(total, reports);
		return result;
	}

}
