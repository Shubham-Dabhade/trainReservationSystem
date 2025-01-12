package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RegisterDao;
import com.dao.UserProfile;
import com.model.Member;

/**
 * Servlet implementation class editProfile
 */
@WebServlet("/editProfile")
public class editProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfileController() {
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
		String userId = request.getParameter("hiddenUserId");
		int userIdInt = Integer.parseInt(userId);
		
		String isAdminString = request.getParameter("hiddenIsAdmin");
		Boolean isAdmin = Boolean.parseBoolean(isAdminString);
		
		String userName = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String phoneNumberString = request.getParameter("userContact");
		Long phoneNumber = Long.parseLong(phoneNumberString);
		String aadharNum = request.getParameter("userAadharNum");
		
		
		//create the member instance
		Member newUser = new Member(userName,email,phoneNumber,aadharNum);
		
		
		//pass the member instance to dao and get the response
		UserProfile userDaoInstance = new UserProfile();
		
		String result = userDaoInstance.editProfile(newUser,userIdInt,isAdmin);
		response.getWriter().println("result");
		
		//based on response route the user
		HttpSession regSession = request.getSession(false);
		if(result.equals("Success:User updated successfully")) {
			regSession.setAttribute("alertType", "success");
	        regSession.setAttribute("alertMessage", "Updation successful!");
	        regSession.setAttribute("userName", userName);
			response.sendRedirect("viewProfile.jsp");
		}
		else {
	        regSession.setAttribute("alertType", "danger");
	        regSession.setAttribute("alertMessage", "Updation failed! Please try again.");
	        response.sendRedirect("viewProfile.jsp");
	    }
	}

}
