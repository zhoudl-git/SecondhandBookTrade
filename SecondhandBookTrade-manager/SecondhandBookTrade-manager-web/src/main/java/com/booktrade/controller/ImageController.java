package com.booktrade.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemCode;
import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbImage;
import com.booktrade.pojo.TbImageExample;
import com.booktrade.pojo.TbImageExample.Criteria;
import com.booktrade.service.ImageService;
import com.booktrade.utils.StringUtil;

/**   
 * @ClassName:  ImageController   
 * @Description:轮播图控制器   
 * @author: zhoudl  
 * @date:   2017年5月22日 下午1:29:23   
 *      
 */
@Controller
@RequestMapping("/image")
public class ImageController {
	@Autowired
	private ImageService imageService;
	@RequestMapping("/getAllImage")
	@ResponseBody
	public LigerUIDataGridResult getAllImage(@RequestParam(defaultValue="1") Integer page, 
			@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request){
		LigerUIDataGridResult allImage = imageService.getAllImage(page, rows);
		return allImage;
	}
	@RequestMapping("/addImage")
	@ResponseBody
	public SystemReturnResult  addImage(@RequestParam("file1") CommonsMultipartFile file1) throws IOException {
        System.out.println(file1.getOriginalFilename());
        int status = 0;
		try {
			System.out.println("上传后的文件路径" + SystemCode.path+new Date().getTime()+file1.getOriginalFilename());
            String fileName = new Date().getTime()+file1.getOriginalFilename();
			//获取输出流
            OutputStream os=new FileOutputStream(SystemCode.path+new Date().getTime()+file1.getOriginalFilename());
            //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
            InputStream is=file1.getInputStream();
            int temp;
            //一个一个字节的读取并写入
            while((temp=is.read())!=(-1))
            {
                os.write(temp);
            }
            TbImage image = new TbImage();
            Date date = new Date();
            image.setCreateTime(date);
            image.setUrl("upload/"+fileName);
            status = imageService.addImage(image);
           os.flush();
           os.close();
           is.close();
         
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //long  endTime=System.currentTimeMillis();
        //System.out.println("方法一的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return new SystemReturnResult(status); 
    }
	@RequestMapping("/updateIdLunBo")
	@ResponseBody
	public SystemReturnResult updateIdLunBo(HttpServletRequest request){
		String status = StringUtil.dnvString(request.getParameter("isLunBo"));
		String imageId = StringUtil.dnvString(request.getParameter("imageId"));
		String link = StringUtil.dnvString(request.getParameter("link"));
		TbImage image = new TbImage();
		if(status.length()>0){
			image.setStatus(Integer.parseInt(status));
		}
		if(link.length()>0){
			image.setLink(link);
		}
		int flag = imageService.updateImage(image, Long.parseLong(imageId));
		return new SystemReturnResult(flag);
	}
	@RequestMapping("/deleteImageById")
	@ResponseBody
	public SystemReturnResult deleteImageById(HttpServletRequest request){
		String imageId = StringUtil.dnvString(request.getParameter("imageId"));
		int status = 0;
		if(imageId.length()>0){
			status = imageService.deleteImageById(Long.parseLong(imageId));
		}
		return new SystemReturnResult(status);
	}
	@RequestMapping("/deleteImages")
	@ResponseBody
	public SystemReturnResult deleteImages(@RequestParam("imageIds") List<Long> imageIds){
		int status = 0;
		if(imageIds != null && imageIds.size() > 0){
			status = imageService.deleteImages(imageIds);
		}
		return new SystemReturnResult(status);
	}
	@RequestMapping("/getAllImageUseIndex")
	@ResponseBody
	public SystemReturnResult getAllImageUseIndex(){
		List<TbImage> images = imageService.getAllImageUseIndex();
		return new SystemReturnResult(images);
	}
}
