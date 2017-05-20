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
}
