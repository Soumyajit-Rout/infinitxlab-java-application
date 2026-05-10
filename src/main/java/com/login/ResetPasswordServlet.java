package com.login;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String enteredOtp = request.getParameter("otp");
        String newPassword = request.getParameter("password");

        HttpSession session = request.getSession();

        String originalOtp =
                (String) session.getAttribute("otp");

        String email =
                (String) session.getAttribute("email");

        PrintWriter out = response.getWriter();

        if(originalOtp.equals(enteredOtp)) {

            try {

                Connection con =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(
                        "update users set password=? where email=?");

                ps.setString(1, newPassword);
                ps.setString(2, email);

                ps.executeUpdate();

                out.println("<h1>Password Updated Successfully</h1>");
                out.println("<a href='index.jsp'>Login Now</a>");

            } catch(Exception e){

                e.printStackTrace();
            }

        } else {

            out.println("<h1>Invalid OTP</h1>");
        }
    }
}
