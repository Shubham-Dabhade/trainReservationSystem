package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.Member;

public class RegisterDao {
	
	public String insertNewUser(Member newUser) {
		String result = "Success:User registered successfully";
		
		
		DBConnection dbInstance = new DBConnection();
		Connection con = dbInstance.getConnection();
		
		String sql = "INSERT INTO USERS(userName,password,email,phone,aadharNumber) VALUES(?,?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, newUser.getUserName());
			ps.setString(2, newUser.getPassword());
			ps.setString(3, newUser.getEmail());
			ps.setLong(4, newUser.getPhoneNo());
			ps.setString(5, newUser.getAadharNum());
			
			int i = ps.executeUpdate();
			if(i>-1) {
				return result;
			}
			else {
				throw new Exception("Failed to insert data.");
			}
		} catch (Exception e) {
			result = "Error:User not registered.";
			e.printStackTrace();
		}
		return result;
	}
}
