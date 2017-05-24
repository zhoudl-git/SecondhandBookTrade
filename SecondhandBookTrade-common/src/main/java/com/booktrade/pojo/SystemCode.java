package com.booktrade.pojo;
/**   
 * @ClassName:  SystemCode   
 * @Description:系统相关状态码 实体类
 * @author: zhoudl  
 * @date:   2017年5月15日 下午11:08:13   
 *      
 */  
@SuppressWarnings("all")
public class SystemCode {
	// 用户被禁用
	public static String userDisable = "0";
	// 用户正常状态
	public static String userShow = "1";
	// 默认用户角色ID
	public static String defaultUserRole = "0";
	// 用户已经在该角色上
	public static String alreadyRole = "-1";
	// 用户支付方式
	public static int paymentTypeByOnline = 1;//在线支付
	public static int paymentType = 2;// 货到付款
	// 用户未登录状态码
	public static int noLogin = -1;
	// 订单状态 1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭'
	public static int orderWF = 1;
	public static int orderYF = 2;
	public static int orderWFH = 3;
	public static int orderYFH = 4;
	public static int orderSuccess = 5;
	public static int orderClose = 6;
	// 未查到数据状态码
	public static int errorData = -2;
	// 书籍状态
	public static Byte bookStatus = new Byte((byte) 1);
	// 文件上传文件夹
	public static String path = "F:\\Graduation_Project\\SecondhandBookTrade-manager\\SecondhandBookTrade-manager-web\\src\\main\\webapp\\WEB-INF\\upload\\";
	// 是否轮播
	public static Integer isLunBo = 1;
	public static Integer noLunBo = 0;
	// 公告是否删除
	public static Integer isDelete = 1;
	public static Integer noIsDelete = 0;
	// 每页显示数据条数
	public static Integer dataByPage = 14;
}
