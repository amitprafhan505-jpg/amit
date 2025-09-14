import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/buy")
public class OrderServlet extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/product_app";
    private static final String USER = "root";
    private static final String PASSWORD = "amit9938"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int product_id = Integer.parseInt(request.getParameter("product_id"));
        int price = Integer.parseInt(request.getParameter("price"));
        String email = (String) session.getAttribute("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);

            // get user_id from email
            String userSql = "SELECT user_id FROM usere WHERE email=?";
            PreparedStatement userPs = con.prepareStatement(userSql);
            userPs.setString(1, email);
            ResultSet rs = userPs.executeQuery();

            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt("user_id");
            }

            // insert into orders table
            String sql = "INSERT INTO orders (order_id, status, total_amount) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, status);
            ps.setInt(3, total_amount);

            int row = ps.executeUpdate();

            if (row > 0) {
                response.sendRedirect("myOrders.jsp");
            } else {
                response.getWriter().println("Error placing order!");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
