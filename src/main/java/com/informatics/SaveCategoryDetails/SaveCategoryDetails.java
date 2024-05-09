package com.informatics.SaveCategoryDetails;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.informatics.DatabaseConnection.DatabaseConnection;
import com.informatics.models.CategoryDetails;

public class SaveCategoryDetails {
	
	private DatabaseConnection dc;
	Connection con ;

	public SaveCategoryDetails() {
		// TODO Auto-generated constructor stub
		this.dc = new DatabaseConnection();
		this.con = dc.getConnect();
	}
	
	public int saveCategoryDetails(CategoryDetails cd) {
		int result = 0;
		String query = "insert into category_details(category_name) values (?)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, cd.getCategory_name());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
}
