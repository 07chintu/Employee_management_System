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

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set request encoding
        request.setCharacterEncoding("UTF-8");

        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String ageStr = request.getParameter("age");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String salaryStr = request.getParameter("salary");

        int age;
        double salary;

        try {
            age = Integer.parseInt(ageStr);
            salary = Double.parseDouble(salaryStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid age or salary value.");
            request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
            return;
        }

        // Insert into database
        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO employees (username, password, email, department, age, phone, address, salary) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, password); // ⚠️ Password should be hashed in production
                stmt.setString(3, email);
                stmt.setString(4, department);
                stmt.setInt(5, age);
                stmt.setString(6, phone);
                stmt.setString(7, address);
                stmt.setDouble(8, salary);

                int result = stmt.executeUpdate();

                if (result > 0) {
                    response.sendRedirect("viewEmployees.jsp"); // redirect after successful addition
                } else {
                    request.setAttribute("errorMessage", "Failed to add employee. Try again.");
                    request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
        }
    }
}
