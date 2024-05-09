package com.informatics.SaveUserDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.informatics.DatabaseConnection.DatabaseConnection;
import com.informatics.models.UserDetails;
import com.informatics.password.PasswordEnDe;




public class LogInUserDetails {
	DatabaseConnection dc ;
	Connection con;
	private String userPassword;
	private String userRole;
private String decryptedPassword;
private String encryptPassword;

	public LogInUserDetails() {
		// TODO Auto-generated constructor stub
		this.dc = new DatabaseConnection();
		this.con = dc.getConnect();
	}
	

	public String loginUserPassword(String username, String password) throws Exception {
		
		ResultSet result = null;
		String query = "select user_password from user_details where user_name = ? "; 
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			result  = ps.executeQuery();
			
			if(result.next()) {
				userPassword = result.getString("user_password");
				 encryptPassword = userPassword;
				decryptedPassword = PasswordEnDe.decrypt(encryptPassword);
return decryptedPassword;
			}
			else {
				decryptedPassword = "null";
				return decryptedPassword;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String loginUserRole(String username, String password) {
		ResultSet result = null;
		String query = "select user_role from user_details where user_name = ? "; 
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			result  = ps.executeQuery();
			
			if(result.next()) {
				userRole = result.getString("user_Role");
				return userRole;
			}else {
				userRole="kk";
				return userRole;
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
