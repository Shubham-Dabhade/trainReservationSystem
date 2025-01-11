package com.controller;

import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.derby.impl.sql.catalog.SYSROUTINEPERMSRowFactory;

import com.dao.LoginDao;
import com.model.Member;
import com.model.MemberLogin;

/**
 * Servlet implementation class loginCon
 */
@WebServlet("/login")
public class loginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public loginCon() {
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
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		MemberLogin loginUser = new MemberLogin();
		
		loginUser.setUserName(username);
		loginUser.setPassword(password);
		
		
		try {
			LoginDao userLoginDao = new LoginDao();
			
			HttpSession exisitingSession = request.getSession(false);
			exisitingSession.setMaxInactiveInterval(60*60*24);
			
			if(exisitingSession != null && exisitingSession.getAttribute("user") != null){
				response.sendRedirect("Home.jsp");
			}
			else{
				Map userData = userLoginDao.validate(loginUser);
				Map.Entry<Integer, Boolean> entry = (Entry<Integer, Boolean>) userData.entrySet().iterator().next();
				if(entry.getKey() != -1){
					exisitingSession.setAttribute("userId", entry.getKey());
					exisitingSession.setAttribute("isAdmin", entry.getValue());
					exisitingSession.setAttribute("userName", username);
					exisitingSession.setAttribute("alertType", "success");
					exisitingSession.setAttribute("alertMessage", "Successfully logged in.");
					System.out.println("Added userId and username to new session userId: "+entry.getKey());
//				if(entry.getValue()) response.sendRedirect("Admin.jsp");
					response.sendRedirect("Home.jsp");
				}
				else {
					exisitingSession.setAttribute("alertType", "danger");
					exisitingSession.setAttribute("alertMessage", "Login failed! Please try again.");
	                response.sendRedirect("login.jsp");
	            }
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
