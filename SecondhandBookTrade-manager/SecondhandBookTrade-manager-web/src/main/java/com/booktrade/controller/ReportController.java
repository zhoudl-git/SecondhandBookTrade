package com.booktrade.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemCode;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbReport;
import com.booktrade.pojo.User;
import com.booktrade.service.impl.ReportService;
import com.booktrade.utils.StringUtil;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/addReport.do")
	@ResponseBody
	public SystemReturnResult addReport(HttpServletRequest request){
		int status = 0;
		String title = StringUtil.dnvString(request.getParameter("title"));
		String content = StringUtil.dnvString(request.getParameter("content"));
		TbReport report = new TbReport();
		Date date = new Date();
		User user = (User)request.getSession().getAttribute("user");
		report.setTitle(title);
		report.setContent(content);
		report.setCreateTime(date);
		report.setUpdateTime(date);
		report.setIsdelte(0);
		if(user != null){
			report.setUserid(user.getId());
		}else{
			status = SystemCode.noLogin;
			return new SystemReturnResult(status);
		}
		status = reportService.addReport(report);
		return new SystemReturnResult(status);
	}
	@RequestMapping("/deleteReportById.do")
	@ResponseBody
	public SystemReturnResult deleteReportById(HttpServletRequest request){
		String reportId = StringUtil.dnvString(request.getParameter("reportId"));
		int status = 0;
		if(reportId.length()>0){
			status = reportService.deleteReport(Long.parseLong(reportId));
		}
		return new SystemReturnResult(status);
	}
	@RequestMapping("/deleteReports.do")
	@ResponseBody
	public SystemReturnResult deleteReports(@RequestParam("reportIds") List<Long> reportIds){
		int status = reportService.deleteReports(reportIds);
		return new SystemReturnResult(status);
	}
	@RequestMapping("/queryReport.do")
	@ResponseBody
	public LigerUIDataGridResult queryReport(@RequestParam(defaultValue="1") Integer page, 
			@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request){
		LigerUIDataGridResult list = reportService.getAllReport(page,rows);
		return list;
	}
	@RequestMapping("/queryReportUserIndex.do")
	@ResponseBody
	public SystemReturnResult queryReportUserIndex(){
		List<TbReport> list = reportService.queryAllReport(SystemCode.noIsDelete);
		return new SystemReturnResult(list);
	}
}
