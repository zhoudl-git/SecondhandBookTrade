package com.booktrade.service;

import java.util.List;
import java.util.Map;

import com.booktrade.pojo.TbShopCat;

public interface ShopCarService {
	int addShopCat(TbShopCat shopCat);// 添加购物车
	int updateShopCatById(Long catId);// 通过购物车ID修改购物车
	// 通过购物车中的商品ID、用户ID、购物车ID修改购物车内容
	int updateShopCatByOtherId(Map<String,Object> map);
	int deleteShopCatById(Long catId,Long itemId,Long userId);
	List<TbShopCat> selectShopCatByUserIDAndItemId(Long userId,Long itemID);
	List<TbShopCat> queryShopCartByUserID(Long userID);
	int deleteShopCatByCatId(Long catId);
	int updateShopCatByCatId(Map<String,Object> map);
	List<TbShopCat> getAllShopCatByCatId(Long [] ids);
}
