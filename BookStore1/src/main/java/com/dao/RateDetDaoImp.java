package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.RateDet;

public class RateDetDaoImp implements RateDetDao{
	
	private Connection con = null;
	public RateDetDaoImp(Connection con) {
		// TODO Auto-generated constructor stub
		this.con = con;
	}
	
	@SuppressWarnings("resource")
	@Override
	public boolean insertRate(RateDet rd) {
		// TODO Auto-generated method stub
		boolean f = false, ex = false;
		String sql = "select uname from rating where uid = ? and bid = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, rd.getUid());
			ps.setInt(2, rd.getBid());
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ex = true;
				break;
			}
			
			if(ex) {
				sql = "update rating set rate = ? where uid = ? and bid = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, rd.getRate());
				ps.setInt(2, rd.getUid());
				ps.setInt(3, rd.getBid());
				
				int i = ps.executeUpdate();
				if(i>0) f = true;
			}
			else {
				sql = "insert into rating values(?,?,?,?)";
				
				ps = con.prepareStatement(sql);
				
				ps.setInt(1, rd.getBid());
				ps.setInt(2, rd.getUid());
				ps.setString(3, rd.getUname());
				ps.setInt(4, rd.getRate());
				
				int i = ps.executeUpdate();
				if(i>0) f = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public List<RateDet> getRate(int bid) {
		// TODO Auto-generated method stub
		List<RateDet> list = new ArrayList<RateDet>();
		String sql = "select uname, rate from rating where bid = ? order by rate desc";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bid);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				RateDet r = new RateDet();
				r.setUname(rs.getString(1));
				r.setRate(rs.getInt(2));
				
				list.add(r);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

}
