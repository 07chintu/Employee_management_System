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

@WebServlet("/AdminChangePasswordServlet")
public class AdminChangePasswordServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form parameters
		String username = request.getParameter("username");
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = Database.getConnection();

			// Check if the admin exists and current password is correct
			String checkSql = "SELECT * FROM users WHERE username = ? AND password = ?";
			stmt = conn.prepareStatement(checkSql);
			stmt.setString(1, username);
			stmt.setString(2, currentPassword);
			rs = stmt.executeQuery();

			if (rs.next()) {
				// Password is correct, update to new password
				stmt.close();
				String updateSql = "UPDATE users SET password = ? WHERE username = ?";
				stmt = conn.prepareStatement(updateSql);
				stmt.setString(1, newPassword);
				stmt.setString(2, username);
				int rowsUpdated = stmt.executeUpdate();

				if (rowsUpdated > 0) {
					request.setAttribute("successMessage", "Password changed successfully.");
					response.setHeader("Refresh", "2; URL=adminLogin.jsp");
				} else {
					request.setAttribute("errorMessage", "Failed to update password. Try again.");
				}
			} else {
				request.setAttribute("errorMessage", "User not found or incorrect current password.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Database error: " + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		// Forward back to the JSP page
		request.getRequestDispatcher("adminChangePassword.jsp").forward(request, response);
	}
}
