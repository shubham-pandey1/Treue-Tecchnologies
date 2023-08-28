package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;
import com.dao.BookDaoImp;
import com.db.Conpro;
import com.entity.BookDet;
import com.entity.User;

/**
 * Servlet implementation class SellOldBook
 */
@MultipartConfig
public class SellOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sess = request.getSession();
		User user = (User)sess.getAttribute("user");
    	
		try {
			String bookname,author,price,bookCategory ="Old",status= "Active",photoname =null, path;
			bookname = request.getParameter("bname");
			author = request.getParameter("aname");
			price = request.getParameter("price");
			
			Part part = request.getPart("file");
			photoname = part.getSubmittedFileName();
			
			BookDet bdt = new BookDet(bookname,author,price,bookCategory,status,photoname,user.getEmail());
			
			
			BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
			boolean f = bdi.addBooks(bdt);
			
			HttpSession sess1 = request.getSession();
			if(f) {
				
				path = "D:\\Java-Programming\\Eclipse\\Servlet3.0\\BookStore1\\src\\main\\webapp\\book\\";
				File file = new File(path);
				part.write(path + photoname);
				sess1.setAttribute("osmsg", "Book added Successfully");
			}
			else sess1.setAttribute("ofmsg", "There is error in insertion");
			response.sendRedirect("SellBook.jsp");
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
		}
	}

}
