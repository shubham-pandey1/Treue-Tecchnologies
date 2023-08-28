package com.user.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BookDaoImp;
import com.db.Conpro;
import com.entity.BookDet;
import com.entity.User;


/**
 * Servlet implementation class BooksAdd
 */
@MultipartConfig
public class BooksAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public BooksAdd() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	HttpSession sess1 = request.getSession();
    	User user = (User)sess1.getAttribute("user");
		try {
			
			String bookname,author,price,bookCategory,status,photoname =null, path;
			bookname = request.getParameter("bname");
			author = request.getParameter("aname");
			price = request.getParameter("price");
			bookCategory = request.getParameter("btype");
			status = request.getParameter("status");
			
			Part part = request.getPart("file");
			photoname = part.getSubmittedFileName();
			
			BookDet bdt = new BookDet(bookname,author,price,bookCategory,status,photoname,user.getEmail());
			
			
			BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
			boolean f = bdi.addBooks(bdt);
			
			HttpSession sess = request.getSession();
			if(f) {
				
				path = "D:\\Java-Programming\\Eclipse\\Servlet3.0\\BookStore1\\src\\main\\webapp\\book\\";
				File file = new File(path);
				part.write(path+ photoname);
				sess.setAttribute("smsg", "Book added Successfully");
			}
			else sess.setAttribute("fmsg", "There is error in insertion");
			response.sendRedirect("admin/add_books.jsp");
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
		}
	}

}
