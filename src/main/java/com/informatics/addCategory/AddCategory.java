package com.informatics.addCategory;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import com.informatics.DatabaseConnection.DatabaseConnection;
import com.informatics.SaveCategoryDetails.SaveCategoryDetails;
import com.informatics.models.CategoryDetails;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet(name = "AddCat", value = "/AddCat")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseConnection dc;
	Connection con;
       
    
    public AddCategory() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.dc = new DatabaseConnection();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.con = dc.getConnect();
			
			CategoryDetails cd = new CategoryDetails(request.getParameter("category_name"));
			SaveCategoryDetails scd = new SaveCategoryDetails();
			
			int result =scd.saveCategoryDetails(cd);
			
			if(result > 0){ // if result is updated or recorded in database(the value of result is 1)
				RequestDispatcher forwardDispatcher = request.getRequestDispatcher("AdminPage.jsp");
				forwardDispatcher.forward(request, response);
			}else{ // if result is not updated or recorded in database(the value of result is -1)
				RequestDispatcher includeDispatcher = request.getRequestDispatcher("Category.jsp");
				includeDispatcher.include(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
