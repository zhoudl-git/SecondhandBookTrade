package com.booktrade.pojo;
/**   
 * @ClassName:  PictureResult   
 * @Description: 上传图片的返回结果定义   
 * @author: zhoudl  
 * @date:   2017年4月9日 下午6:33:50   
 *      
 */  
public class PictureResult {

	private int error;
	private String url;
	private String message;
	
	private PictureResult(int error, String url, String message) {
		this.error = error;
		this.url = url;
		this.message = message;
	}
	/**   
	 * @Title: ok   
	 * @Description: 成功时调用方法   
	 * @param: @param url
	 * @param: @return      
	 * @return: PictureResult      
	 * @throws   
	 */  
	public static PictureResult ok(String url) {
		return new PictureResult(0, url, null);
	}
	/**   
	 * @Title: error   
	 * @Description: 失败时调用方法   
	 * @param: @param message
	 * @param: @return      
	 * @return: PictureResult      
	 * @throws   
	 */  
	public static PictureResult error(String message) {
		return new PictureResult(1, null, message);
	}
	public int getError() {
		return error;
	}
	public void setError(int error) {
		this.error = error;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
