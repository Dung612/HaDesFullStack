package Hades.main.dto;

public class Contact {
	private String name;
	private String email;
	private String mobile;
	private String address;
	private String message;
	
	
	public Contact() {
		super();
	}
	
	public Contact(String address, String name, String message, String mobile, String email) {
		this.address = address;
		this.name = name;
		this.message = message;
		this.mobile = mobile;
		this.email = email;
	}
	
	
	public String getAddress() {
		return address;
	}
	public String getEmail() {
		return email;
	} 
	public String getMessage() {
		return message;
	}
	public String getMobile() {
		return mobile;
	}
	public String getName() {
		return name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setName(String name) {
		this.name = name;
	}

}

