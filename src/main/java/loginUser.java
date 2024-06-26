import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class loginUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String url = "jdbc:mysql://localhost:3306/Authentication";
        String user = "root";
        String dbPassword = "Rahul@2004";
        
        try (Connection conn = DriverManager.getConnection(url, user, dbPassword)) {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()) {
                // User authenticated, set session attribute and redirect to dashboard
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("dashboard.jsp");
            } else {
                // Authentication failed, display an error message
                response.sendRedirect("login.jsp?error=invalidCredentials");
            }
        } catch(Exception e) {
            // Handle any errors
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=databaseError");
        }
    }
}
