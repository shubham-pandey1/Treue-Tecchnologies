package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDet;
import com.entity.Order;

public class OrderDaoImp implements OrderDao{
	
	private Connection con = null;
	public OrderDaoImp(Connection con) {
		// TODO Auto-generated constructor stub
		this.con = con;
	}

	@Override
	public boolean placedorder(List<Order> list) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
		
		String sql = "insert into userorder(uid,cid,uname,email,address,phone,bookname,author,price,paymode) values(?,?,?,?,?,?,?,?,?,?)" ;
		con.setAutoCommit(false);
		PreparedStatement ps = con.prepareStatement(sql);
		for(Order o: list) {
			ps.setInt(1, o.getUid());
			ps.setInt(2, o.getCid());
			ps.setString(3, o.getUname());
			ps.setString(4, o.getEmail());
			ps.setString(5, o.getAddress());
			ps.setString(6, o.getPhone());
			ps.setString(7, o.getBookname());
			ps.setString(8, o.getAuthor());
			ps.setString(9, o.getPrice());
			ps.setString(10, o.getPayment());
			ps.addBatch();
		}
		int ar[] = ps.executeBatch();
		con.commit();
		f = true;
		con.setAutoCommit(true);
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	@Override
	public List<Order> getOrderedBook(int uid) {
		// TODO Auto-generated method stub
		List<Order> list = new ArrayList<Order>();
		
		
		try {
			String sql = "select * from userorder where uid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				o.setSoid(rs.getInt(1));
				o.setUid(rs.getInt(2));
				o.setCid(rs.getInt(3));
				o.setUname(rs.getString(4));
				o.setEmail(rs.getString(5));
				o.setAddress(rs.getString(6));
				o.setPhone(rs.getString(7));
				o.setBookname(rs.getString(8));
				o.setAuthor(rs.getString(9));
				o.setPrice(rs.getString(10));
				o.setPayment(rs.getString(11));
				
				
				list.add(o);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Order> getAllOrdered() {
		// TODO Auto-generated method stub
		List<Order> list = new ArrayList<Order>();
		
		
		try {
			String sql = "select * from userorder";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				o.setSoid(rs.getInt(1));
				o.setUid(rs.getInt(2));
				o.setCid(rs.getInt(3));
				o.setUname(rs.getString(4));
				o.setEmail(rs.getString(5));
				o.setAddress(rs.getString(6));
				o.setPhone(rs.getString(7));
				o.setBookname(rs.getString(8));
				o.setAuthor(rs.getString(9));
				o.setPrice(rs.getString(10));
				o.setPayment(rs.getString(11));
				
				
				list.add(o);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
		
	}

}
