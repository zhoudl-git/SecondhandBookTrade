package com.booktrade.pojo;

/**   
 * @ClassName:  Menu   
 * @Description: 左侧菜单树实体类   
 * @author: zhoudl  
 * @date:   2017年5月16日 下午7:24:45   
 *      
 */  
public class Menu {
/*SELECT DISTINCT  a.id AS pId,a.name pName,b.id ,b.name,b.url
    FROM tb_function a
    LEFT JOIN tb_function b ON a.id=b.parent_id*/
	private Long pId;
	private String pName;
	private String name;
	private String url;
	private Long id;
	private String icon;
    private boolean open;
    private String level;
    private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public Long getpId() {
		return pId;
	}
	public void setpId(Long pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
}
