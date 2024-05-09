package com.informatics.adminPage;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class AdminPage
 */
public class AdminPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminPage() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			response.sendRedirect("SignIn.jsp");
		}
	}

}
