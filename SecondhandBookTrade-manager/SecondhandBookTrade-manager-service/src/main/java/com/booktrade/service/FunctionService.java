package com.booktrade.service;

import java.util.List;
import java.util.Map;

import com.booktrade.pojo.Menu;
import com.booktrade.pojo.TbFunction;

/**   
 * @ClassName:  FunctionService   
 * @Description: 菜单服务类   
 * @author: zhoudl  
 * @date:   2017年5月16日 下午1:25:07   
 *      
 */  
public interface FunctionService {
	public int addMenu(Map<String,Object> map);
	public int deleteMenu(Long id);
	public int updateMenu(Map<String,Object> map);
	public List<TbFunction> queryAllMenu();
	public List<TbFunction> getAllMenu2(Long userId);
	public int saveTreeNode(TbFunction function);
	public List<Menu> getAllMenu();
}
