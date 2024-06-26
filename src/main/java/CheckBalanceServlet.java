import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/checkBalanceServlet")
public class CheckBalanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system", "root", "Rahul@2004");
            String sql = "SELECT balance FROM accounts WHERE account_number = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, accountNumber);
            rs = stmt.executeQuery();
            if (rs.next()) {
                double balance = rs.getDouble("balance");
                response.sendRedirect("balance.jsp?balance=" + balance);
            } else {
                response.sendRedirect("failure.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("failure.jsp");
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
