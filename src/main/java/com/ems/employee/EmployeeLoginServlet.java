package com.ems.employee;

import java.io.IOException;
import java.sql.*;

import com.ems.utility.Database;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EmployeeLoginServlet")
public class EmployeeLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Username or Password cannot be empty.");
            request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
            return;
        }

        try (Connection conn = Database.getConnection()) {
            String query = "SELECT * FROM employees WHERE username = ? AND password = ? ";
            try (PreparedStatement pst = conn.prepareStatement(query)) {
                pst.setString(1, username);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("department", rs.getString("department"));
                    session.setAttribute("age", rs.getInt("age"));
                    session.setAttribute("phone", rs.getString("phone"));
                    session.setAttribute("address", rs.getString("address"));
                    session.setAttribute("salary", rs.getDouble("salary"));

                    response.sendRedirect("EmployeeDashboard.jsp");
                } else {
                    request.setAttribute("errorMessage", "Invalid username or password.");
                    request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred.");
            request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
        }
    }
}
