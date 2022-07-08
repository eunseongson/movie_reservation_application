package dto;

import java.io.Serializable;

public class MemberDto implements Serializable{

	private String id;
	private String pwd;
	private String name;
	private String email;	// UNIQUE
	private String phone;	// 01012345678
	private int auth;		// 3:일반회원, 1:관리자
	
	public MemberDto() {
		
	}
	
	public MemberDto(String id, String pwd, String name, String email, String phone, int auth) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.auth = auth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", auth=" + auth + "]";
	}
	
}
