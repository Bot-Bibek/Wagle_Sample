package com.informatics.models;

import java.util.Base64;


import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class UserDetails {
	/**
	 * 
	 */
	private String user_name;
	private String user_email;
	private String user_contact;
	private String user_password;
	private String user_image;
	
	private String user_role;
	private static final String ENCRYPTION_KEY = "mySecretKey12345";
	
	public UserDetails(String user_name, String user_email, String user_contact, String user_password,
			 String user_role, String user_image)throws Exception {
		super();
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_contact = user_contact;
		this.user_password = user_password;
		this.user_image = user_image;
		this.user_role = user_role;
		
		 SecretKeySpec secretKey = new SecretKeySpec(ENCRYPTION_KEY.getBytes(), "AES");
	        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
	        byte[] encryptedBytes = cipher.doFinal(this.user_password.getBytes());
	        this.user_password = Base64.getEncoder().encodeToString(encryptedBytes); 
	        
	     
	}

	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	public UserDetails() {
		super();
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_contact() {
		return user_contact;
	}
	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	

}