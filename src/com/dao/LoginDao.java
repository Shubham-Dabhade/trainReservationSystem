package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.model.MemberLogin;

public class LoginDao {
	public Map<Integer,Boolean> validate(MemberLogin loginUser){
		Map<Integer,Boolean> userData = new HashMap<>();
		
		int id = -1;
		boolean isAdmin = false;
		
		DBConnection dbInstance = new DBConnection();
		Connection con = dbInstance.getConnection();
				
		PreparedStatement ps = null;
		ResultSet rs = null; 
		
		String sql = "SELECT * FROM Users where userName=? AND password=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, loginUser.getUserName());
			ps.setString(2, loginUser.getPassword());
			rs = ps.executeQuery();
			
			if(rs.next()){
				System.out.println(rs);
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		userData.put(id, isAdmin);
		return userData;
	}
}
