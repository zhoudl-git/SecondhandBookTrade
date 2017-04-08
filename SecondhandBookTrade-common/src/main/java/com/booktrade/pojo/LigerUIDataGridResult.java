package com.booktrade.pojo;

import java.util.List;

/**   
 * @ClassName:  LigerUIDataGridResult   
 * @Description: LigetUI框架 Grid组件所需数据封装格式   
 * @author: zhoudl  
 * @date:   2017年4月8日 下午1:16:43   
 *      
 */  
public class LigerUIDataGridResult {
	
	/**   
	 * @Fields total : 数据总数   
	 */   
	private long total;
	/**   
	 * @Fields Rows : 数据存储集合   
	 */   
	private List<?> Rows;
	
	public LigerUIDataGridResult(long total, List<?> Rows) {
		this.total = total;
		this.Rows = Rows;
	}
	
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<?> getRows() {
		return Rows;
	}
	public void setRows(List<?> Rows) {
		this.Rows = Rows;
	}
}
