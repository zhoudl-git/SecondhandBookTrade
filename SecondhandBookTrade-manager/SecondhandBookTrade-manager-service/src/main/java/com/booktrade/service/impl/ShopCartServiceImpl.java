package com.booktrade.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booktrade.dao.TbShopCatMapper;
import com.booktrade.pojo.TbShopCat;
import com.booktrade.pojo.TbShopCatExample;
import com.booktrade.pojo.TbShopCatExample.Criteria;
import com.booktrade.service.ShopCarService;
@Service
public class ShopCartServiceImpl implements ShopCarService {
	@Autowired
	private TbShopCatMapper shopCatMapper;

	@Override
	public int addShopCat(TbShopCat shopCat) {
		int status = shopCatMapper.insert(shopCat);
		return status;
	}

	@Override
	public int updateShopCatById(Long catId) {
		return 0;
	}

	@Override
	public int updateShopCatByOtherId(Map<String, Object> map) {
		int status = shopCatMapper.updateByOtherId(map);
		return status;
	}

	@Override
	public int deleteShopCatById(Long catId,Long itemId,Long userId) {
		TbShopCatExample example = new TbShopCatExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		criteria.andItemIdEqualTo(itemId);
		int status = shopCatMapper.deleteByExample(example);
		return status;
	}

	@Override
	public List<TbShopCat> selectShopCatByUserIDAndItemId(Long userId, Long itemID) {
		TbShopCatExample example = new TbShopCatExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		criteria.andItemIdEqualTo(itemID);
		List<TbShopCat> shopCats = shopCatMapper.selectByExample(example);
		return shopCats;
	}

	@Override
	public List<TbShopCat> queryShopCartByUserID(Long userID) {
		TbShopCatExample example = new TbShopCatExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userID);
		List<TbShopCat> shopCats = shopCatMapper.selectByExample(example);
		return shopCats;
	}

	@Override
	public int deleteShopCatByCatId(Long catId) {
		int status = shopCatMapper.deleteByPrimaryKey(catId);
		return status;
	}

	@Override
	public int updateShopCatByCatId(Map<String, Object> map) {
		int status = shopCatMapper.updateShopCatByCatId(map);
		return status;
	}

	@Override
	public List<TbShopCat> getAllShopCatByCatId(Long[] ids) {
		List<Long> list = new ArrayList<Long>();
		if(ids != null && ids.length > 0){
			for(int i=0;i<ids.length;i++){
				list.add(ids[i]);
			}
		}
		TbShopCatExample example = new TbShopCatExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(list);
		List<TbShopCat> shopCats = shopCatMapper.selectByExample(example);
		return shopCats;
	}
}
