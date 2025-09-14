import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/product_app";
    private static final String USER = "root";
    private static final String PASSWORD = "amit9938"; // your DB password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String priceStr = request.getParameter("price");

        try {
            double price = Double.parseDouble(priceStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);

            // Insert into products table
            String sql = "INSERT INTO product (product_name, category_name, price) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setDouble(3, price);

            int row = ps.executeUpdate();

            if (row > 0) {
                out.println("<h3 style='color:green'>Product added successfully!</h3>");
                out.println("<a href='admin.jsp'>Add Another Product</a><br>");
                out.println("<a href='welcome.jsp'>Back to Home</a>");
            } else {
                out.println("<h3 style='color:red'>Failed to add product. Try again!</h3>");
                out.println("<a href='admin.jsp'>Back</a>");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
            out.println("<a href='admin.jsp'>Back</a>");
        }
    }
}
