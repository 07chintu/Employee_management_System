package com.ems.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ems.utility.Database;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String employeeId = request.getParameter("employeeId");
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Database.getConnection();
            String sql = "DELETE FROM employees WHERE id = ?"; // use 'username = ?' if using username instead
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, employeeId);

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                request.setAttribute("message", "Employee deleted successfully.");
            } else {
                request.setAttribute("error", "Employee not found.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error deleting employee: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("deleteEmployee.jsp").forward(request, response);
    }
}
