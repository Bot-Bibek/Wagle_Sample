package com.informatics.SaveUserDetails;

import java.sql.Connection;



import java.sql.PreparedStatement;


import com.informatics.DatabaseConnection.DatabaseConnection;
import com.informatics.models.UserDetails;


public class SaveUserDetails {
	DatabaseConnection dc ;
	Connection con;

	public SaveUserDetails() {
		// TODO Auto-generated constructor stub
		this.dc = new DatabaseConnection();
		this.con = dc.getConnect();
	}
	
	public int saveUserDetails(UserDetails ud) {
		int result = 0;
		String query = "insert into user_details (user_name, user_email, user_contact, user_password,user_role,user_image) values(?,?,?,?,?,?)"; // ask to insert data in database
		try {
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, ud.getUser_name());
			ps.setString(2, ud.getUser_email());
			ps.setString(3, ud.getUser_contact());
			ps.setString(4, ud.getUser_password());
			ps.setString(5,"User");
			ps.setString(6, ud.getUser_image());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
