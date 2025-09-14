import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/product_app";
    private static final String USER = "root";
    private static final String PASSWORD = "amit9938"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql = "SELECT * FROM usere WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("userName", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("isadmine", rs.getInt("isadmine")); 

                int isAdmin = rs.getInt("isadmine");

                if (isAdmin == 1) {
                    
                    response.sendRedirect("admin.jsp");
                } else {
                   
                    response.sendRedirect("home.jsp");
                }

            } else {
               
                response.sendRedirect("login.jsp?error=true");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
