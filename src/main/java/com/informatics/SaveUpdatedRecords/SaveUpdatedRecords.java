package com.informatics.SaveUpdatedRecords;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.informatics.DatabaseConnection.DatabaseConnection;

/**
 * Servlet implementation class SaveUpdatedRecords
 */
public class SaveUpdatedRecords extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseConnection dc;
	Connection con;   
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.dc = new DatabaseConnection();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.con = dc.getConnect();
			
			String product_name = request.getParameter("updated_product_name");
			int product_price = Integer.parseInt(request.getParameter("updated_product_price"));
			int product_category = Integer.parseInt(request.getParameter("updated_product_category"));
			int product_quantity = Integer.parseInt(request.getParameter("updated_product_quantity"));
			String product_description = request.getParameter("updated_product_description");
			String product_id = request.getParameter("product_id");
						
			String query = "update product_details set product_name = ?, product_price = ?, product_category = ?, product_quantity = ?, product_description = ? where product_id = ?"; // ask to insert data in database
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, product_name);
			ps.setInt(2, product_price);
			ps.setInt(3, product_category);
			ps.setInt(4, product_quantity);
			ps.setString(5, product_description);
			ps.setString(6, product_id);
			int result = ps.executeUpdate();
			
			if(result > 0){ // if result is updated or recorded in database(the value of result is 1)
				RequestDispatcher forwardDispatcher = request.getRequestDispatcher("ProductRecords.jsp");
				forwardDispatcher.forward(request, response);
			}else{ // if result is not updated or recorded in database(the value of result is -1)
				RequestDispatcher includeDispatcher = request.getRequestDispatcher("EditProductDetails.jsp");
				includeDispatcher.include(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
		

}
