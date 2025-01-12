package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserProfile;
import com.model.Member;

/**
 * Servlet implementation class userProfile
 */
@WebServlet("/getUserProfile")
public class userProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userProfile() {
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
		System.out.println(((Object)request.getParameter("userId")).getClass().getSimpleName());
		String userId = request.getParameter("userId");
		String isAdminString = request.getParameter("isAdmin");
		
		Integer userIdInt = Integer.parseInt(userId);
		Boolean isAdmin = Boolean.parseBoolean(isAdminString);
		
		UserProfile uPInstance = new UserProfile();
		
		Member fetchedUser = uPInstance.viewProfile(userIdInt,isAdmin);
		
		
		// Create a JSON object and populate it with fetched data
		// Manually creating a JSON string
        String jsonResponse = "{"
            + "\"userName\": \"" + fetchedUser.getUserName() + "\","
            + "\"userEmail\": \"" + fetchedUser.getEmail() + "\","
            + "\"userContact\": \"" + fetchedUser.getPhoneNo() + "\","
            + "\"userAadharNum\": \"" + fetchedUser.getAadharNum() + "\""
            + "}";
		
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
        

	}

}
