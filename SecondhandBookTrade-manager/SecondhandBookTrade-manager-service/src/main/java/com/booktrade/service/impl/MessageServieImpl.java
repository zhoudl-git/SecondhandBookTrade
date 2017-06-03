package com.booktrade.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbMessageMapper;
import com.booktrade.dao.UserMapper;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemCode;
import com.booktrade.pojo.TbMessage;
import com.booktrade.pojo.TbMessageExample;
import com.booktrade.pojo.TbReport;
import com.booktrade.pojo.TbReportExample;
import com.booktrade.pojo.TbReportExample.Criteria;
import com.booktrade.pojo.User;
import com.booktrade.service.MessageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class MessageServieImpl implements MessageService {
	@Autowired 
	TbMessageMapper messageMapper;
	@Autowired
	UserMapper userMapper;
	@Override
	public int addReport(TbMessage report) {
		int status = messageMapper.insert(report);
		return status;
	}

	@Override
	public int deleteReport(Long reportId) {
		TbMessage record = new TbMessage();
		record.setIsdelte(SystemCode.isDelete);// 公告删除标记
		TbMessageExample example = new TbMessageExample();
		com.booktrade.pojo.TbMessageExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(reportId);
		int status = messageMapper.updateByExample(record, example);
		return status;
	}

	@Override
	public List<TbMessage> queryAllReport(Long itemId,Integer isdelete) {
		TbMessageExample example = new TbMessageExample();
		com.booktrade.pojo.TbMessageExample.Criteria criteria = example.createCriteria();
		if(isdelete != null){
			criteria.andIsdelteEqualTo(isdelete);
		}
		if(itemId != null){
			criteria.andItemIdEqualTo(itemId);
		}
		List<TbMessage> reports = messageMapper.selectByExample(example);
		// 组合出用户名
		for(int i=0;i<reports.size();i++){
			User user = userMapper.getUserById(reports.get(i).getIssuerId());
			if(user != null){
				reports.get(i).setIssUserName((user.getUsername()));
			}
		}
		return reports;
	}

	@Override
	public int deleteReports(List<Long> list) {
		TbMessageExample example = new TbMessageExample();
		com.booktrade.pojo.TbMessageExample.Criteria criteria = example.createCriteria();
		criteria.andIdIn(list);
		int status = messageMapper.deleteByExample(example);
		return status;
	}

	/*@Override
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
	}*/

}
