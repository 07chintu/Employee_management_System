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

@WebServlet("/AdminSignupServlet")
public class AdminSignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = Database.getConnection()) {
            String checkSql = "SELECT * FROM users WHERE role = 'Admin'";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql);
                 ResultSet rs = checkStmt.executeQuery()) {
                 
                if (rs.next()) {
                    // Admin already exists
                    request.setAttribute("errorMessage", "Admin already exists. Please login instead.");
                    request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
                } else {
                    String insertSql = "INSERT INTO users (username, password, role) VALUES (?, ?, 'Admin')";
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                        insertStmt.setString(1, username);
                        insertStmt.setString(2, password);
                        int result = insertStmt.executeUpdate();
                        if (result > 0) {
                            request.setAttribute("successMessage", "Admin account created successfully! You can login now.");
                            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
                        } else {
                            request.setAttribute("errorMessage", "Failed to create admin.");
                            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("adminSignup.jsp").forward(request, response);
        }
    }
}
