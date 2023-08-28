package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDet;

public class BookDaoImp implements BookDao{
	private Connection con;
	
	@Override
	public boolean addBooks(BookDet bdt) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			
			String sql = "insert into bookdetail(bookname,author,price,bookcategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bdt.getBookname());
			ps.setString(2, bdt.getAuthor());
			ps.setString(3, bdt.getPrice());
			ps.setString(4, bdt.getBookCategory());
			ps.setString(5, bdt.getStatus());
			ps.setString(6, bdt.getPhotoname());
			ps.setString(7, bdt.getEmail());
			
			int i = ps.executeUpdate();
			
			if(i>0) f= true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	public BookDaoImp(Connection con) {
		// TODO Auto-generated constructor stub
		this.con = con;
	}
	
	@Override
	public List<BookDet> getAllBooks() {
		// TODO Auto-generated method stub
		List<BookDet> list = new ArrayList<BookDet>();
		BookDet bdt = null;
		
		try {
			String sql = "select * from bookdetail";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDet b = new BookDet();
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public BookDet getBookbyId(int id) {
		
		// TODO Auto-generated method stub
		BookDet b = new BookDet();
		try {
			String sql = "Select * from Bookdetail where bookid = ?"; 
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return b;
	}
	@Override
	public boolean updateEditBooks(BookDet bdt) {
		// TODO Auto-generated method stub
		boolean f = false;
		
		try {
			String sql = "update bookdetail set bookname=?, author = ?, price = ?, status = ? where bookid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,bdt.getBookname());
			ps.setString(2, bdt.getAuthor());
			ps.setString(3, bdt.getPrice());
			ps.setString(4, bdt.getStatus());
			ps.setInt(5, bdt.getBookID());
			
			int i = ps.executeUpdate();
			
			if(i>0) f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	@Override
	public boolean deleteBooks(int id) {
		// TODO Auto-generated method stub
		boolean f = false;
		String sql = "delete from bookdetail where bookid = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if(i>0) f = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<BookDet> getNewBooks() {
		// TODO Auto-generated method stub
		List<BookDet> list = new ArrayList<>();
		BookDet bdt = new BookDet();
		try {
			String sql = "Select * from bookdetail where status = ? and bookcategory = ? order by bookid desc";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, "active");
			ps.setString(2, "new");
			
			ResultSet rs = ps.executeQuery();
			
			int i = 0;
			while (rs.next() && i++<4) {
				BookDet bd = new BookDet();
				bd.setBookID(rs.getInt(1));
				bd.setBookname(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoname(rs.getString(7));
				list.add(bd);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDet> getRecentBooks() {
		// TODO Auto-generated method stub
		List<BookDet> list = new ArrayList<>();
		
		try {
			String sql = "Select * from bookdetail where status = ? order by bookid desc";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, "active");
			
			ResultSet rs = ps.executeQuery();
			
			int i = 0;
			while (rs.next() && i++<4) {
				BookDet bdt = new BookDet();
				bdt.setBookID(rs.getInt(1));
				bdt.setBookname(rs.getString(2));
				bdt.setAuthor(rs.getString(3));
				bdt.setPrice(rs.getString(4));
				bdt.setBookCategory(rs.getString(5));
				bdt.setStatus(rs.getString(6));
				bdt.setPhotoname(rs.getString(7));
				list.add(bdt);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
		
	}

	@Override
	public List<BookDet> getOldBooks() {
		// TODO Auto-generated method stub
		List<BookDet> list = new ArrayList<>();
		BookDet bdt = new BookDet();
		try {
			String sql = "Select * from bookdetail where bookcategory =? and status = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "old");
			ps.setString(2, "active");
			
			ResultSet rs = ps.executeQuery();
			
			int i = 0;
			while (rs.next() && i++<4) {
				bdt.setBookID(rs.getInt(1));
				bdt.setBookname(rs.getString(2));
				bdt.setAuthor(rs.getString(3));
				bdt.setPrice(rs.getString(4));
				bdt.setBookCategory(rs.getString(5));
				bdt.setStatus(rs.getString(6));
				bdt.setPhotoname(rs.getString(7));
				list.add(bdt);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDet> getAllNewBooks() {
		// TODO Auto-generated method stub
		List<BookDet> list = new ArrayList<>();
		BookDet bdt = new BookDet();
		try {
			String sql = "Select * from bookdetail where status = ? and bookcategory = ? order by bookid desc";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, "active");
			ps.setString(2, "new");
			
			ResultSet rs = ps.executeQuery();
			
			
			while (rs.next()) {
				BookDet bd = new BookDet();
				bd.setBookID(rs.getInt(1));
				bd.setBookname(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoname(rs.getString(7));
				list.add(bd);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDet> getAllRecentBooks() {
		// TODO Auto-generated method stub
		List<BookDet> list = new ArrayList<>();
		
		try {
			String sql = "Select * from bookdetail where status = ? order by bookid desc";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, "active");
			
			ResultSet rs = ps.executeQuery();
			
			
			while (rs.next()) {
				BookDet bdt = new BookDet();
				bdt.setBookID(rs.getInt(1));
				bdt.setBookname(rs.getString(2));
				bdt.setAuthor(rs.getString(3));
				bdt.setPrice(rs.getString(4));
				bdt.setBookCategory(rs.getString(5));
				bdt.setStatus(rs.getString(6));
				bdt.setPhotoname(rs.getString(7));
				list.add(bdt);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDet> getAllOldBooks() {
		// TODO Auto-generated method stub
		List<BookDet> list = new ArrayList<>();
		BookDet bdt = new BookDet();
		try {
			String sql = "Select * from bookdetail where bookcategory =? and status = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "old");
			ps.setString(2, "active");
			
			ResultSet rs = ps.executeQuery();
			
			int i = 0;
			while (rs.next() && i++<4) {
				bdt.setBookID(rs.getInt(1));
				bdt.setBookname(rs.getString(2));
				bdt.setAuthor(rs.getString(3));
				bdt.setPrice(rs.getString(4));
				bdt.setBookCategory(rs.getString(5));
				bdt.setStatus(rs.getString(6));
				bdt.setPhotoname(rs.getString(7));
				list.add(bdt);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<BookDet> getMyBook(String email) {
		// TODO Auto-generated method stub
		List<BookDet> list = new ArrayList<BookDet>();
		BookDet bdt = null;
		
		try {
			String sql = "select * from bookdetail where email = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDet b = new BookDet();
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<BookDet> getSearchBooks(String ch) {
		// TODO Auto-generated method stub
		List<BookDet> list = new ArrayList<BookDet>();
		BookDet bdt = null;
		
		try {
			String sql = "select * from bookdetail where bookname like ? or author like ? or bookcategory like ? and status = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%"+ch + "%");
			ps.setString(2, "%"+ch + "%");
			ps.setString(3, "%"+ch + "%");
			ps.setString(4, "active");
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDet b = new BookDet();
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
