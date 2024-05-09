package com.informatics.logIn;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.informatics.DatabaseConnection.DatabaseConnection;
import com.informatics.password.PasswordEnDe;

/**
 * Servlet implementation class LogIN
 */
public class LogIN extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseConnection dc;
	Connection con;

	public LogIN() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.dc = new DatabaseConnection();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.con = dc.getConnect();

			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();
			
			String username = request.getParameter("user_name");
			String password = request.getParameter("user_password");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM user_details WHERE user_name = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
			     String dbEncryptedPassword = rs.getString("user_password");

			    //Decrypt the password using the PasswordEnDe class
			    String decryptedPassword = PasswordEnDe.decrypt(dbEncryptedPassword); 

			    if (password.equals(decryptedPassword)) {
			        String user_role = rs.getString("user_role");

			        if (user_role != null && user_role.equals("Admin")) {
			            System.out.println("User role: " + user_role);
			            
			            session.setAttribute("admin", username);
			            
			            RequestDispatcher forwardDispatcher = request.getRequestDispatcher("AdminPage.jsp");
						forwardDispatcher.forward(request, response);
			        } else {
			        	System.out.println("User role: " + user_role);
			            
			            session.setAttribute("user", username);
			            
			            RequestDispatcher forwardDispatcher = request.getRequestDispatcher("continue.jsp");
			            
						forwardDispatcher.forward(request, response);
			        }
			    } else {   
		            RequestDispatcher includeDispatcher = request.getRequestDispatcher("SignIn.jsp");
					includeDispatcher.include(request, response);
			        out.println("error");
			    }
			} else {
				RequestDispatcher includeDispatcher = request.getRequestDispatcher("SignIn.jsp");
				includeDispatcher.include(request, response);
			   out.println("Username not found! Please Enter Valid UserName");
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
