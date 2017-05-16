package com.booktrade.pojo;

import java.util.Date;

/**   
 * @ClassName:  User   
 * @Description:User实体类
 * @author: zhoudl  
 * @date:   2017年5月15日 下午2:39:22   
 *      
 */  
public class User {
	/*{"username":"123","passwordword":"123456",
	 * "sex":"男","phone":"18809428954",
	 * "email":"18809428954@163.com","date":"2017-05-03",
	 * "identity":"62242419940929523X","interest":"1",
	 * "quiz1":"浙江","quiz2":"杭州","quiz3":"西湖区",
	 * "like[write]":"on","like[read]":"on"}*/
	private Long userId;
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	// 用户名
	private String username;
	// 密码
	private String password;
	// 性别
	private String sex;
	// 联系电话
	private String phone;
	// email
	private String email;
	// 生日
	private String birthday;
	// 身份证号
	private String identity;
	// 用户角色
	private String role;
	// 用户常住地址
	private String address;
	// 用户详细地址
	private String addressDetail;
	// 爱好
	private String interest;
	// 注册时间
	private Date created;
	// 修改时间
	private Date updated;
	// 用户状态
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
}
