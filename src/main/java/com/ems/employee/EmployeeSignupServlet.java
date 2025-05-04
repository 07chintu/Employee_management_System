package com.ems.employee;

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

@WebServlet("/EmployeeSignupServlet")
public class EmployeeSignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set character encoding to UTF-8 to avoid issues with non-ASCII characters
        request.setCharacterEncoding("UTF-8");

        // Retrieving the multiple employee data
        String[] usernames = request.getParameterValues("username");
        String[] passwords = request.getParameterValues("password");
        String[] emails = request.getParameterValues("email");
        String[] departments = request.getParameterValues("department");
        String[] ages = request.getParameterValues("age");
        String[] phones = request.getParameterValues("phone");
        String[] addresses = request.getParameterValues("address");
        String[] salaries = request.getParameterValues("salary");

        // Check if the arrays are not null and if they have the same length
        if (usernames == null || passwords == null || emails == null || departments == null ||
            ages == null || phones == null || addresses == null || salaries == null ||
            usernames.length != passwords.length || usernames.length != emails.length) {
            request.setAttribute("errorMessage", "All fields are required and must have the same number of entries.");
            request.getRequestDispatcher("employeeSignup.jsp").forward(request, response);
            return;
        }

        // Database connection and prepared statement
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Get database connection using utility class
            conn = Database.getConnection();

            // SQL query to insert employee details
            String sql = "INSERT INTO employees (username, password, email, department, age, phone, address, salary) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            // Prepare the statement
            stmt = conn.prepareStatement(sql);

            // Loop through each employee data and insert it into the database
            for (int i = 0; i < usernames.length; i++) {
                // Set values for each employee
                stmt.setString(1, usernames[i]);
                stmt.setString(2, passwords[i]); // Passwords should be hashed for security purposes
                stmt.setString(3, emails[i]);
                stmt.setString(4, departments[i]);
                stmt.setInt(5, Integer.parseInt(ages[i]));
                stmt.setString(6, phones[i]);
                stmt.setString(7, addresses[i]);
                stmt.setDouble(8, Double.parseDouble(salaries[i])); // Adding salary to the statement

                // Add to batch
                stmt.addBatch();
            }

            // Execute the batch insert for all employees
            int[] rowsAffected = stmt.executeBatch();

            // If the batch insert was successful, redirect to the login page
            if (rowsAffected.length > 0) {
                response.sendRedirect("employeeLogin.jsp");
            } else {
                // If insert failed, show error message
                request.setAttribute("errorMessage", "Something went wrong. Please try again.");
                request.getRequestDispatcher("employeeSignup.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection or SQL errors
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("employeeSignup.jsp").forward(request, response);
        } finally {
            // Close database resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
