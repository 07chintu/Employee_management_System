package com.ems.employee;

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

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    // Safe trim for handling null parameters
    private String safeTrim(String input) {
        return (input == null) ? "" : input.trim();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read and trim form inputs
        String username = safeTrim(request.getParameter("username"));
        String currentPassword = safeTrim(request.getParameter("currentPassword"));
        String newPassword = safeTrim(request.getParameter("newPassword"));

        if (username.isEmpty() || currentPassword.isEmpty() || newPassword.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = Database.getConnection();

            // Step 1: Check if the username exists and the current password is correct
            String checkSql = "SELECT * FROM employees WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(checkSql);
            stmt.setString(1, username);
            stmt.setString(2, currentPassword); // In production, this should be hashed
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Step 2: Update the password
                stmt.close(); // Close previous statement

                String updateSql = "UPDATE employees SET password = ? WHERE username = ?";
                stmt = conn.prepareStatement(updateSql);
                stmt.setString(1, newPassword);
                stmt.setString(2, username);

                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    // Success: Set success message and redirect to login page
                    request.setAttribute("message", "Password updated successfully.");
                    response.setHeader("Refresh", "2; URL=employeeLogin.jsp"); // 2 seconds delay
                    return; // End method execution after redirect setup
                } else {
                    // Failure: Set error message
                    request.setAttribute("errorMessage", "Failed to update password. Please try again.");
                }
            } else {
                // Incorrect username or password
                request.setAttribute("errorMessage", "Incorrect username or current password.");
            }

            // Forward to the change password page to show error message
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
