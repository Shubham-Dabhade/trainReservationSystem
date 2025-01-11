package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RegisterDao;
import com.model.Member;

/**
 * Servlet implementation class registrationControllers
 */
@WebServlet(name = "registrationController", urlPatterns = { "/register" })
public class registrationControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registrationControllers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// fetch the user request data
		String userName = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String phoneNumberString = request.getParameter("contact");
		Long phoneNumber = Long.parseLong(phoneNumberString);
		String aadharNum = request.getParameter("aadhaar");
		
		
		//create the member instance
		Member newUser = new Member(userName,password,email,phoneNumber,aadharNum);
		
		
		//pass the member instance to dao and get the response
		RegisterDao registerInstance = new RegisterDao();
		
		String result = registerInstance.insertNewUser(newUser);
		response.getWriter().println("result");
		
		//based on response route the user
		HttpSession regSession = request.getSession(false);
		if(result.equals("Success:User registered successfully")) {
			regSession.setAttribute("alertType", "success");
	        regSession.setAttribute("alertMessage", "Registration successful! Please login.");
			response.sendRedirect("login.jsp");
		}
		else {
	        regSession.setAttribute("alertType", "danger");
	        regSession.setAttribute("alertMessage", "Registration failed! Please try again.");
	        response.sendRedirect("registration.jsp");
	    }
		
	}

}
