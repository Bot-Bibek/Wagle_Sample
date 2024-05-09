package com.informatics.SaveProductDetails;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.informatics.DatabaseConnection.DatabaseConnection;
import com.informatics.models.ProductDetails;

import jakarta.servlet.annotation.MultipartConfig;

@MultipartConfig
public class SaveProductsDetails { 
	 private DatabaseConnection dc;
	 Connection  con;
	 private ArrayList<ProductDetails> productList;
	 
	 public SaveProductsDetails() {
			// TODO Auto-generated constructor stub
		 	
			this.dc = new DatabaseConnection();
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			this.con = dc.getConnect();
		}
	 
	 public int saveProductDetails(ProductDetails pd) {
		 int result = 0;
		 String query = "insert into product_details (product_name,product_price,product_category,product_quantity,product_description,product_image)  values (?,?,?,?,?,?)";
		
		 
		 try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, pd.getProduct_name());
			ps.setInt(2, pd.getProduct_price());
			ps.setInt(3, pd.getProduct_category());
			ps.setInt(4, pd.getProduct_quantity());
			ps.setString(5, pd.getProduct_description());
			ps.setString(6, pd.getProduct_image());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return result;
	 }
	 
	 public ArrayList<ProductDetails> getAllProducts(){
		 return productList; 
	 }

  }

