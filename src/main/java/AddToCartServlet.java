
import jakarta.servlet.ServletException;


import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import com.google.gson.Gson;
import com.informatics.DatabaseConnection.DatabaseConnection;



public class AddToCartServlet extends HttpServlet {
	
	
	
	
	/*
	 * private DatabaseConnection dc; Connection con;
	 */

  private static final long serialVersionUID = 1L;
  private Map<String, CartItem> cartItems = new HashMap<>();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException{
	  
	  HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		if(user == null){
			response.sendRedirect("SignIn.jsp");
		}
	  

	  
		/*
		 * String user = request.getParameter("user");
		 * System.out.println("Received user attribute value: " + user);
		 */
		/*
		 * this.dc = new DatabaseConnection();
		 * 
		 * try { Class.forName("com.mysql.cj.jdbc.Driver"); this.con = dc.getConnect();
		 * 
		 * String product_name = product.getName(); Double product_price =
		 * product.getPrice(); int product_quantity = product.getQuantity();
		 * 
		 * 
		 * 
		 * } catch (ClassNotFoundException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		
    // Get the product information from the request body
    System.out.println("Reading request body...");
    String requestBody = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
    System.out.println("Request body: " + requestBody);
    Product product = new Gson().fromJson(requestBody, Product.class);
    System.out.println("Product information: " + product);
	/*
	 * String product_name = product.getName(); Double product_price =
	 * product.getPrice(); int product_quantity = product.getQuantity();
	 */
	/* System.out.println(product_name); */
    if (product != null && product.getId() != null && product.getName() != null && product.getPrice() >= 0 && product.getQuantity() > 0) {
      // Check if the item is already in the cart
    	DatabaseConnection dc = new DatabaseConnection();
        Connection conn = dc.getConnect();

        try {
            // Prepare the SQL statement with placeholders for parameters
            String sql = "INSERT INTO cart (pname, pprice, pquantity, person) VALUES (?, ?, ?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // Set the values of the parameters
            pstmt.setString(1, product.getName());
            pstmt.setDouble(2, product.getPrice());
            pstmt.setInt(3, product.getQuantity());
            pstmt.setString(4, user);

            // Execute the SQL statement
            pstmt.executeUpdate();

            // Clean up resources by closing the PreparedStatement and Connection objects
            pstmt.close();
            conn.close();
            
            // Return 1 to indicate that the product was successfully inserted
            return;
        } catch (SQLException e) {
            // Handle any SQL errors that occur during execution
            e.printStackTrace();
        }
      if (cartItems.containsKey(product.getId())) {
        // If the item is already in the cart, update its quantity
        System.out.println("Item is already in the cart...");
        CartItem cartItem = cartItems.get(product.getId());
        cartItem.setQuantity(cartItem.getQuantity() + product.getQuantity());
        System.out.println("Updated cart item: " + cartItem);
        
        
        
        
        
     // Declare and initialize the DatabaseConnection and Connection objects
		/*
		 * DatabaseConnection dc = new DatabaseConnection(); Connection conn =
		 * dc.getConnect();
		 */

        

        // Return 0 to indicate that the product was not inserted due to an error
        return;
        
      } else {
        // If the item is not in the cart, add it to the cart
        System.out.println("Item is not in the cart...");
        cartItems.put(product.getId(), new CartItem(product.getName(), product.getPrice(), product.getQuantity()));
        System.out.println("Added cart item: " + cartItems.get(product.getId()));
      }
      
      // Send a success response 
      response.setStatus(HttpServletResponse.SC_OK);
   // Set the cartItems map as an attribute of the request object
	/*
	 * request.setAttribute("cartItems", cartItems); // Forward the request to the
	 * Cart.jsp page request.getRequestDispatcher("Cart.jsp").forward(request,
	 * response);
	 */
    } else {
      // Send a bad request response
      response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product information");
    }
  }

  
  // Define the CartItem class
  private static class CartItem {
    private String name;
    private double price;
    private int quantity;

    public CartItem(String name, double price, int quantity) {
      this.name = name;
      this.price = price;
      this.quantity = quantity;
    }

    public String getName() {
      return name;
    }

    public double getPrice() {
      return price;
    }

    public int getQuantity() {
      return quantity;
    }

    public void setQuantity(int quantity) {
      this.quantity = quantity;
    }
    
    @Override
    public String toString() {
        return "CartItem [name=" + name + ", price=" + price + ", quantity=" + quantity + "]";
    }
    
  }


  // Define the Product class
  private static class Product {
    private String id;
    private String name;
    private double price;
    private int quantity;

    public String getId() {
      return id;
    }

    public String getName() {
      return name;
    }

    public double getPrice() {
      return price;
    }

    public int getQuantity() {
      return quantity;
    }
  }
}
