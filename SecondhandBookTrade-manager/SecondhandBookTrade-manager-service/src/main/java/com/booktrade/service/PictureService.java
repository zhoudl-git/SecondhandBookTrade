package com.booktrade.service;

import org.springframework.web.multipart.MultipartFile;

import com.booktrade.pojo.PictureResult;


/**   
 * @ClassName:  PictureService   
 * @Description:上传图片处理Service   
 * @author: zhoudl  
 * @date:   2017年4月9日 下午6:36:13   
 *      
 */  
public interface PictureService {

	PictureResult uploadPicture(MultipartFile uploadFile,String se);
}
