import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/cart")
public class Cartservelet extends HttpServlet {
    private static final String url = "jdbc:mysql://localhost:3306/product_app";
    private static final String user = "root";
    private static final String password = "amit9938";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int productId = Integer.parseInt(request.getParameter("productId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            PreparedStatement ps = con.prepareStatement("SELECT * FROM product WHERE product_id=?");
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            HttpSession session = request.getSession();
            ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            if (rs.next()) {
                String[] item = {
                    rs.getString("product_id"),
                    rs.getString("product_name"),
                    rs.getString("category_name"),
                    rs.getString("price")
                };
                cart.add(item);
            }

            session.setAttribute("cart", cart);
            con.close();

            response.sendRedirect("cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
