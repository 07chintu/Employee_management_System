package com.ems.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ems.utility.Database;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddSalaryServlet")
public class AddSalaryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int empId = Integer.parseInt(request.getParameter("empId"));
        String month = request.getParameter("month");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String status = request.getParameter("status");

        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO salary (emp_id, month, amount, status) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, empId);
            ps.setString(2, month);
            ps.setDouble(3, amount);
            ps.setString(4, status);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("salaryReports.jsp");
            } else {
                response.getWriter().println("Failed to add salary record.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
