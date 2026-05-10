package com.login;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "select * from users where username=? and password=?");

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            PrintWriter out = response.getWriter();

            if(rs.next()){

                response.sendRedirect("success.jsp");

            } else {

                out.println("<h1>Invalid Username or Password</h1>");
            }

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}
