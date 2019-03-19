package com.booktrade.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbImageMapper;
import com.booktrade.pojo.LigerUIDataGridResult;
import com.booktrade.pojo.SystemCode;
import com.booktrade.pojo.TbImage;
import com.booktrade.pojo.TbImageExample;
import com.booktrade.pojo.TbImageExample.Criteria;
import com.booktrade.service.ImageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ImageSercieImpl implements ImageService {
	@Autowired
	private TbImageMapper imageMapper;

	@Override
	public int addImage(TbImage image) {
		int status = imageMapper.insert(image);
		
		return status;
	}
	@Override
	public int updateImage(TbImage image,Long imageId) {
		TbImageExample example = new TbImageExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(imageId);
		int status = imageMapper.updateByExampleSelective(image, example);
		return status;
	}

	@Override
	public int deleteImageById(Long imageId) {
		int status = imageMapper.deleteByPrimaryKey(imageId);
		return status;
	}

	@Override
	public LigerUIDataGridResult getAllImage(Integer page, Integer rows) {
		TbImageExample example = new TbImageExample();
		List<TbImage> list = imageMapper.selectByExample(example);
		//分页处理
		PageHelper.startPage(page, rows);
		//执行查询
		//添加条件
		//Criteria criteria = example.createCriteria();
		//criteria.and;
		//List<TbUser> list = userMapper.selectByExample(example);
		//List<User> list = userMapper.getAllUser();
		//取total
		PageInfo<TbImage> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		
		//创建返回值对象
		LigerUIDataGridResult result = new LigerUIDataGridResult(total, list);
		return result;
	}
	@Override
	public int deleteImages(List<Long> list) {
		TbImageExample example = new TbImageExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(list);
		int status = imageMapper.deleteByExample(example);
		return status;
	}
	@Override
	public List<TbImage> getAllImageUseIndex() {
		TbImageExample example = new TbImageExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(SystemCode.isLunBo);
		List<TbImage> list = imageMapper.selectByExample(example);
		return list;
	}

}
