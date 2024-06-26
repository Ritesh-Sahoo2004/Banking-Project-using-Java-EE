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

@WebServlet("/register")
public class registerUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (!password.equals(confirmPassword)) {
            // Passwords do not match, display an error message
            response.sendRedirect("register.jsp?error=passwordMismatch");
            return;
        }
        
        String url = "jdbc:mysql://localhost:3306/Authentication";
        String user = "root";
        String dbPassword = "Rahul@2004";
        
        try (Connection conn = DriverManager.getConnection(url, user, dbPassword)) {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()) {
                // Username already exists, display an error message
                response.sendRedirect("register.jsp?error=usernameExists");
            } else {
                stmt = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.executeUpdate();
                
                // Registration successful, redirect to login page
               
                response.sendRedirect("login.jsp?success=true");
            }
        } catch(Exception e) {
            // Handle any errors
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=databaseError");
        }
    }
}

