package com.booktrade.service;

import java.util.List;

import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.TbImage;

public interface ImageService {
	int addImage(TbImage image);
	//int udpateImageById(Long imageId);
	int updateImage(TbImage image,Long imageId);
	int deleteImageById(Long imageId);
	LigerUIDataGridResult getAllImage(Integer page, Integer rows);
	int deleteImages(List<Long> list);
	List<TbImage> getAllImageUseIndex();
}
