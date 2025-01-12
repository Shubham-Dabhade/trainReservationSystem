package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Member;

public class UserProfile {
	public Member viewProfile(Integer userId,Boolean isAdmin) {
		Member fetchedMember = null;

		DBConnection dbInstance = new DBConnection();
		Connection con = dbInstance.getConnection();

		String sql;
		
		if (isAdmin) {
	        sql = "SELECT * FROM ADMIN WHERE userId=?";
	    } else {
	        sql = "SELECT * FROM USERS WHERE userId=?";
	    }

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				fetchedMember = new Member();
				fetchedMember.setUserName(rs.getString("userName"));
				fetchedMember.setEmail(rs.getString("email"));
				fetchedMember.setPhoneNo(rs.getLong("phone"));
				fetchedMember.setAadharNum(rs.getString("aadharNumber"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return fetchedMember;

	}

	public String editProfile(Member editMem,int userId,Boolean isAdmin) {
		String result = "Success:User updated successfully";

		DBConnection dbInstance = new DBConnection();
		Connection con = dbInstance.getConnection();

		String sql;

		
		if (isAdmin) {
	        sql = "UPDATE ADMIN SET userName=?,email=?,phone=?,aadharNumber=? where userId=?";
	    } else {
	        sql = "UPDATE USERS SET userName=?,email=?,phone=?,aadharNumber=? where userId=?";
	    }
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, editMem.getUserName());
			ps.setString(2, editMem.getEmail());
			ps.setLong(3, editMem.getPhoneNo());
			ps.setString(4, editMem.getAadharNum());
			ps.setInt(5, userId);

			int i = ps.executeUpdate();
			if (i > -1) {
				return result;
			} else {
				throw new Exception("Failed to update data.");
			}
		} catch (Exception e) {
			result = "Error:User not updated.";
			e.printStackTrace();
		}
		return result;
	}
}
