package com.booktrade.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booktrade.pojo.SystemReturnResult;
import com.booktrade.pojo.TbItem;
import com.booktrade.pojo.TbShopCat;
import com.booktrade.pojo.User;
import com.booktrade.service.ItemService;
import com.booktrade.service.ShopCarService;
import com.booktrade.utils.StringUtil;

/**   
 * @ClassName:  ShopCartController   
 * @Description:购物车控制器   
 * @author: zhoudl  
 * @date:   2017年5月21日 下午12:49:14   
 *      
 */  
@Controller
@RequestMapping("/cat")
public class ShopCartController {
	@Autowired
	private ShopCarService shopCatServie;
	@Autowired
	private ItemService ItemService;
	@RequestMapping("/addShopCat")
	@ResponseBody
	public SystemReturnResult addShopCat(HttpServletRequest request){
		Long itemID = Long.parseLong(StringUtil.dnvString(request.getParameter("itemId")));
		// 通过商品ID查询该商品的基本信息 
		List<TbItem> items = ItemService.selectBookByItemId(itemID);
		Integer status = 0;
		if(items != null && items.size() > 0){
			TbItem tbItem = items.get(0);
			User user = (User)request.getSession().getAttribute("user");
			if(user != null){
				Long userId = user.getId();
				// 价格根据后台数据库获得 防止前台篡改数据
				Long price = tbItem.getPrice();
				//Long userId = Long.parseLong(StringUtil.dnvString(request.getParameter("userId")));
				//Integer num = 1;// 默认添加购物车数量为1
				Integer num = Integer.parseInt(StringUtil.dnvString(request.getParameter("num")));
				//Long price = Long.parseLong(StringUtil.dnvString(request.getParameter("price")));
				// 添加购物车之前先查看该商品是否在购物车中
				List<TbShopCat> oldShopCat = shopCatServie.selectShopCatByUserIDAndItemId(userId, itemID);
				TbShopCat shopCat = new TbShopCat();
				Date date = new Date();
				// 购物车中已经存在该商品
				if(oldShopCat != null && oldShopCat.size() > 0){
					TbShopCat tbShopCat = oldShopCat.get(0);
					num += tbShopCat.getNum();
					price += tbShopCat.getPrice();
					Map<String, Object> map = new HashMap<String,Object>();
					map.put("num", num);
					map.put("price", price);
					map.put("update", date);
					map.put("userId", tbShopCat.getUserId());
					map.put("itemId", tbShopCat.getItemId());
					map.put("updated", date);
					status = shopCatServie.updateShopCatByOtherId(map);
				}else{
					shopCat.setItemId(itemID);
					shopCat.setItemName(tbItem.getTitle());
					shopCat.setUserId(userId);
					shopCat.setNum(num);
					shopCat.setPrice(price);
					shopCat.setCreated(date);
					shopCat.setUpdated(date);
					shopCat.setFunctionId(1L);
					shopCat.setImage(tbItem.getImage());
					status = shopCatServie.addShopCat(shopCat);
				}
			}else{
				status = -2;// 未登录 登录之后添加购物车
			}
		}else{
			status = -1;// 商品表中不存在该商品
		}
		return new SystemReturnResult(status);
	}
	@RequestMapping("/queryShopCartByUserID")
	@ResponseBody
	public SystemReturnResult queryShopCartByUserID(HttpServletRequest request){
	    User user =	(User)request.getSession().getAttribute("user");
	    List<TbShopCat> shopCats = null;
	    if(user != null){
	    	shopCats = shopCatServie.queryShopCartByUserID(user.getId());
	    }
		return new SystemReturnResult(shopCats);
	}
	@RequestMapping("/deleteShopCatByCatId")
	@ResponseBody
	public SystemReturnResult deleteShopCatByCatId(HttpServletRequest request){
		int status = shopCatServie.deleteShopCatByCatId(Long.parseLong(StringUtil.dnvString(request.getParameter("catId"))));
		return new SystemReturnResult(status);
	}
	@RequestMapping("/updateShopCatByCatId")
	@ResponseBody
	public SystemReturnResult updateShopCatByCatId(HttpServletRequest request){
		String id = StringUtil.dnvString(request.getParameter("id"));
		String num = StringUtil.dnvString(request.getParameter("num"));
		String price = StringUtil.dnvString(request.getParameter("price"));
		Integer status = 0;
		User user = (User)request.getSession().getAttribute("user");
		if(user != null){
			Date date = new Date();
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("num", num);
			map.put("price", price);
			map.put("updated", date);
			map.put("id", id);
			map.put("userId", user.getId());
			status = shopCatServie.updateShopCatByCatId(map);
		}else{
			status = -1;// 用户未登录
		}
		return new SystemReturnResult(status);
	}
	@RequestMapping("/queryOrderDetail")
	@ResponseBody
	public SystemReturnResult queryOrderDetail(@RequestParam("catIds") Long [] catIds){
		List<TbShopCat> shopCats = shopCatServie.getAllShopCatByCatId(catIds);
		return new SystemReturnResult(shopCats);
	}
}
