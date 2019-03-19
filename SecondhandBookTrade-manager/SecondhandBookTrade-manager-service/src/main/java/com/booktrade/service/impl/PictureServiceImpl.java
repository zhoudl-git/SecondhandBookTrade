package com.booktrade.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.booktrade.pojo.PictureResult;
import com.booktrade.service.PictureService;
import com.booktrade.utils.ExceptionUtil;
import com.booktrade.utils.FtpUtil;
import com.booktrade.utils.IDUtils;


/**   
 * @ClassName:  PictureServiceImpl   
 * @Description:上传图片处理服务实现类  
 * @author: zhoudl  
 * @date:   2017年4月9日 下午6:37:02   
 *      
 */  
@Service
public class PictureServiceImpl implements PictureService {
	
	/*@Value("${FTP_ADDRESS}")
	private String FTP_ADDRESS;
	@Value("${FTP_PORT}")
	private Integer FTP_PORT;
	@Value("${FTP_USER_NAME}")
	private String FTP_USER_NAME;
	@Value("${FTP_PASSWORD}")
	private String FTP_PASSWORD;
	@Value("${FTP_BASE_PATH}")
	private String FTP_BASE_PATH;
	@Value("${IMAGE_BASE_URL}")
	private String IMAGE_BASE_URL;*/
	// 访问图片的URL
	private String IMAGE_BASE_URL = "/SecondhandBookTrade-manager-web/upload";
	

	@Override
	public PictureResult uploadPicture(MultipartFile uploadFile,String servletPath) {
		//判断上传图片是否为空
		if (null == uploadFile || uploadFile.isEmpty()) {
			return PictureResult.error("上传图片为空");
		}
		//取文件扩展名
		String originalFilename = uploadFile.getOriginalFilename();
		//文件后缀名
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		//生成新文件名
		//可以使用uuid生成新文件名。
		//UUID randomUUID = UUID.randomUUID();
		//可以是时间+随机数生成文件名
		String imageName = IDUtils.genImageName();
		//把图片上传到ftp服务器（图片服务器）
		//需要把ftp的参数配置到配置文件中
		//文件在服务器的存放路径，应该使用日期分隔的目录结构
		DateTime dateTime = new DateTime();
		String filePath = dateTime.toString("/yyyy/MM/dd/");
		String src = "F:\\Graduation_Project\\SecondhandBookTrade-manager\\SecondhandBookTrade-manager-web\\src\\main\\webapp\\WEB-INF\\upload\\";
		uploadFileIO(uploadFile,src + originalFilename);
		//uploadFileIO(uploadFile, "F://upload" + "/" + originalFilename);
		/*try {
			FtpUtil.uploadFile(FTP_ADDRESS, FTP_PORT, FTP_USER_NAME, FTP_PASSWORD, 
					FTP_BASE_PATH, filePath, imageName + ext, uploadFile.getInputStream());
		} catch (Exception e) {
			e.printStackTrace();
			return PictureResult.error(ExceptionUtil.getStackTrace(e));
		}*/
		//返回结果，生成一个可以访问到图片的url返回
		//return PictureResult.ok("upload/1.png");//images/delete.png
		return PictureResult.ok("upload/" + originalFilename/*IMAGE_BASE_URL + filePath + "/" + imageName + ext*/);
	}
	// 上传文件IO操作过程
	private void uploadFileIO(MultipartFile file,String uploadFilePath) {
		FileOutputStream os = null;
		InputStream in = null;
		try {
			
			os = new FileOutputStream(uploadFilePath);
			in= file.getInputStream(); 
	         int b = 0; 
	         while((b=in.read()) != -1){ 
	           os.write(b); 
	         } 
	         os.flush(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
	        try {
				os.close();
				in.close(); 
			} catch (IOException e) {
				e.printStackTrace();
			} 
	        
		}
	}


}
