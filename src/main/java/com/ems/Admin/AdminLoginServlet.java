package com.ems.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ems.utility.Database;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Get the username and password from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = Database.getConnection()) {
            // Query to check the username and password
            String query = "SELECT * FROM users WHERE username = ? AND role = 'Admin'";
            try (PreparedStatement pst = conn.prepareStatement(query)) {
                pst.setString(1, username);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    // User found, now check if password matches (consider password hashing)
                    String storedPassword = rs.getString("password");

                    // For production, compare hashed passwords
                    if (password.equals(storedPassword)) {
                        // Successful login, redirect to the admin dashboard
                    	HttpSession session = request.getSession();
                    	session.setAttribute("username", username); 
                        response.sendRedirect("adminDashboard.jsp");
                    } else {
                        // Password incorrect
                        request.setAttribute("errorMessage", "Invalid username or password.");
                        request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
                    }
                } else {
                    // Username not found or not an admin
                    request.setAttribute("errorMessage", "Invalid username or password.");
                    response.sendRedirect("adminLogin.jsp?error=1");

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error. Please try again later.");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
    }
}
