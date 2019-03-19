package com.booktrade.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.booktrade.pojo.PictureResult;
import com.booktrade.service.PictureService;
import com.booktrade.utils.JsonUtils;


/**   
 * @ClassName:  PictureController   
 * @Description:图片上传控制器   
 * @author: zhoudl  
 * @date:   2017年4月9日 下午6:38:09   
 *      
 */  
@Controller
public class PictureController {
	@Autowired
	private PictureService pictureService;
	
	@RequestMapping("/pic/upload")
	@ResponseBody
	public String upload(MultipartFile uploadFile,HttpServletRequest request) {
		String servletPath = request.getSession().getServletContext().getRealPath("upload");
		System.out.println(servletPath);
		PictureResult result = pictureService.uploadPicture(uploadFile,servletPath);
		return JsonUtils.objectToJson(result);
	}
}
