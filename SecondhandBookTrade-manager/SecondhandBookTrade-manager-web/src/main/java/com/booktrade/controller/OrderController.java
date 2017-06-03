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
import com.booktrade.pojo.TbOrder;
import com.booktrade.pojo.TbShopCat;
import com.booktrade.pojo.User;
import com.booktrade.service.OrderService;
import com.booktrade.service.ShopCarService;
import com.booktrade.utils.IDUtils;
import com.booktrade.utils.StringUtil;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderServie;
	@Autowired
	private ShopCarService shopCatService;
	@RequestMapping("/addOrder")
	@ResponseBody
	public SystemReturnResult addOrder(HttpServletRequest request,@RequestParam("catIds") Long [] catIds){
		TbOrder order = new TbOrder();
		Date date = new Date();
		int status1 = 0;
		List<TbShopCat> shopCats = shopCatService.getAllShopCatByCatId(catIds);
		if(shopCats != null && shopCats.size() > 0){
			int totalPrice = 0;
			String image = "";
			for (TbShopCat shopCat : shopCats) {
				totalPrice += shopCat.getPrice();// 从后台查询实付金额
				image += shopCat.getImage()+",";
			}
			Long orderId = IDUtils.genItemId();
			//String payment = StringUtil.dnvString(request.getParameter("payment"));
			//String paymentType = StringUtil.dnvString(request.getParameter("paymentType"));
			//String status = StringUtil.dnvString(request.getParameter("status"));
			String addressdetail = StringUtil.dnvString(request.getParameter("addressdetail"));
			order.setOrderId(orderId+"");
			order.setAddressdetail(addressdetail);
			order.setUpdateTime(date);
			order.setCreateTime(date);
			order.setPayment(totalPrice+"");
			// 实际创建字段时该字段为买家留言 此处为了方便 暂时用于存储商品订单图片
			order.setBuyerMessage(image.substring(0,image.length()-1));
			order.setPaymentType(SystemCode.paymentTypeByOnline);// 默认货到付款
			order.setStatus(SystemCode.orderSuccess);
			User user = (User)request.getSession().getAttribute("user");
			if(user != null){
				order.setUserId(user.getId());
				order.setBuyerNick(user.getUsername());
				status1 = orderServie.addOrder(order);
			}else{
				status1 = SystemCode.noLogin;
			}
		}else{
			status1 = SystemCode.errorData;// 未查到数据
		}
		if(status1 == 1){// 下单成功 删除购物车中的商品数据
			for(int i=0;i<catIds.length;i++){
				shopCatService.deleteShopCatByCatId(catIds[i]);
			}
		}
		return new SystemReturnResult(status1);
	}
	
	@RequestMapping("/queryOrder")
	@ResponseBody
	public SystemReturnResult queryOrder(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		int status = 0;
		List<TbOrder> queryOrder = null;
		if(user != null){
			queryOrder = orderServie.queryOrder(user.getId());
		}else{
			status = SystemCode.noLogin;
			return new SystemReturnResult(status);
		}
		return new SystemReturnResult(queryOrder);
	}
	@RequestMapping("/getAllOrder")
	@ResponseBody
	public LigerUIDataGridResult getAllOrder(@RequestParam(defaultValue="1") Integer page, 
			@RequestParam(defaultValue="30") Integer rows,HttpServletRequest request){
		LigerUIDataGridResult allOrder = orderServie.getAllOrder(page, rows);
		return allOrder;
	}
}
