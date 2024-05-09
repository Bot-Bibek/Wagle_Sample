package com.informatics.addProduct;

import jakarta.servlet.RequestDispatcher;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import com.informatics.DatabaseConnection.DatabaseConnection;
import com.informatics.SaveProductDetails.SaveProductsDetails;

import com.informatics.models.ProductDetails;

/**
 * Servlet implementation class AddProduct
 */
@MultipartConfig
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseConnection dc;
	Connection con;
 
    public AddProduct() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		jakarta.servlet.http.Part file = request.getPart("product_image"); // Extracts or fetch the chosen file(image)
		
		String product_image = file.getSubmittedFileName(); //Stores the name of file(image)
		/* System.out.println(imageName); */
		
		String uploadPath = "C:/Users/Acer/git/CourseWork-Java-/Course_work/src/main/webapp/image/"+product_image; // Path for uploading chosen file (image) is stored
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
			
			ProductDetails pd = new ProductDetails(request.getParameter("product_name"), Integer.parseInt(request.getParameter("product_price")),Integer.parseInt(request.getParameter("product_category")) ,Integer.parseInt(request.getParameter("product_quantity")), request.getParameter("product_description"), product_image);
			SaveProductsDetails spd = new SaveProductsDetails();
			
			int result = spd.saveProductDetails(pd);
			
			if(result > 0){ // if result is updated or recorded in database(the value of result is 1)
				RequestDispatcher forwardDispatcher = request.getRequestDispatcher("Product.jsp");
				forwardDispatcher.forward(request, response);
			}else{ // if result is not updated or recorded in database(the value of result is -1)
				RequestDispatcher includeDispatcher = request.getRequestDispatcher("Product.jsp");
				includeDispatcher.include(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
