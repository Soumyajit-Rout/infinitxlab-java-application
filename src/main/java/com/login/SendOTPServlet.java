package com.login;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class SendOTPServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        String otp = String.valueOf(new Random().nextInt(999999));

        HttpSession session = request.getSession();

        session.setAttribute("otp", otp);
        session.setAttribute("email", email);

        final String senderEmail = "infinitxlab@gmail.com";
        final String senderPassword = "oawg yxez frmi rzfr";

        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session mailSession = Session.getInstance(props,
                new Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(
                        senderEmail,
                        senderPassword);
            }
        });

        try {

            Message message = new MimeMessage(mailSession);

            message.setFrom(new InternetAddress(senderEmail));

            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email));

            message.setSubject("OTP For Password Reset");

            message.setText("Your OTP is: " + otp);

            Transport.send(message);

            response.sendRedirect("otp.jsp");

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
