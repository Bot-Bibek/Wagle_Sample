

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.informatics.DatabaseConnection.DatabaseConnection;

/**
 * Servlet implementation class UpdateProductQuantityServlet
 */
public class UpdateProductQuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductQuantityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		    try {
		      // Get the product name and quantity from the request parameters
		    	String requestBody = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
		    	System.out.println("Request body: " + requestBody);
		    	JsonObject jsonObject = new Gson().fromJson(requestBody, JsonObject.class);
		    	String productName = jsonObject.get("product_name").getAsString();
		    	System.out.println("Product name: " + productName);


		      // Load the JDBC driver
		      

		      // Connect to the database
		      DatabaseConnection dc = new DatabaseConnection();
		      Class.forName("com.mysql.cj.jdbc.Driver");
		      Connection con = dc.getConnect();
		      // Prepare the SQL statement to update the product quantity
		      String sql = "UPDATE product_details SET product_quantity = product_quantity - 1 WHERE product_name = ?";
		      PreparedStatement pstmt = con.prepareStatement(sql);
		      pstmt.setString(1, productName);

		      // Execute the SQL statement
		      pstmt.executeUpdate();

		      // Close the PreparedStatement and Connection objects
		      pstmt.close();
		      con.close();

		      // Send a success response back to the client
		      response.setStatus(HttpServletResponse.SC_OK);
		      response.getWriter().println("Product quantity updated successfully");

		    } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
		      // Handle any exceptions that occur
		      e.printStackTrace();
		      response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		      response.getWriter().println("Error updating product quantity");
		    }
		  }
		}
