package com.servle;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class configure extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    
    private static final String username = "pratik";
    private static final String password = "123456";

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        PrintWriter out = response.getWriter();
       

        HttpSession session = request.getSession();

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        if (userName.equals(username) && password.equals(password)) {
            
            session.setAttribute("message", "Welcome, " + username + "! You have successfully logged in.");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else {
           
            session.setAttribute("message", "Login failed. Please check your username and password and try again.");
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            rd.forward(request, response);
        }

    }
}
