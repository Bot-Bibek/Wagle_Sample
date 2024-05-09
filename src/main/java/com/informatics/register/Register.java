package com.informatics.register;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import com.informatics.DatabaseConnection.DatabaseConnection;
import com.informatics.SaveUserDetails.SaveUserDetails;
import com.informatics.models.UserDetails;

/**
 * Servlet implementation class Register
 */
@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseConnection dc;
	Connection con;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		jakarta.servlet.http.Part file = request.getPart("user_image"); // Extracts or fetch the chosen file(image)
		
		String user_image = file.getSubmittedFileName(); //Stores the name of file(image)
		/* System.out.println(imageName); */
		
		String uploadPath = "C:/Users/Acer/git/CourseWork-Java-/Course_work/src/main/webapp/user_image/"+ user_image; // Path for uploading chosen file (image) is stored
		System.out.println(uploadPath); 
		
		this.dc = new DatabaseConnection();
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.con = dc.getConnect();
			
			FileOutputStream fops = new FileOutputStream(uploadPath); // Writes the data of chosen file (image)
			InputStream fips = file.getInputStream(); // Reads the data of chosen file (image)
			
			byte[] data = new byte[fips.available()]; 
			fips.read(data);
			fops.write(data);
			fops.close();
			
			UserDetails user = new UserDetails(request.getParameter("user_name"), request.getParameter("user_email"), request.getParameter("user_contact"), request.getParameter("user_password"), request.getParameter("user_role"), user_image);
			SaveUserDetails sud = new SaveUserDetails(); 
			
			int result = sud.saveUserDetails(user); // Updates or records the values in database user_details table8

			if(result > 0){ // if result is updated or recorded in database(the value of result is 1)
				RequestDispatcher forwardDispatcher = request.getRequestDispatcher("SignIn.jsp");
				forwardDispatcher.forward(request, response);
			}else{ // if result is not updated or recorded in database(the value of result is -1)
				RequestDispatcher includeDispatcher = request.getRequestDispatcher("SignUp.jsp");
				includeDispatcher.include(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
