package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImp;
import com.dao.CartDaoImp;
import com.db.Conpro;
import com.entity.BookDet;
import com.entity.Cart;

/**
 * Servlet implementation class CartServ
 */
public class CartServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int bid,uid;
		bid = Integer.parseInt(request.getParameter("id"));
		uid = Integer.parseInt(request.getParameter("uid"));
		String page = request.getParameter("pg");
		
		BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
		BookDet bdt = bdi.getBookbyId(bid);
		
		Cart c = new Cart();
		c.setBid(bdt.getBookID());
		c.setUid(uid);
		c.setBookname(bdt.getBookname());
		c.setAuthor(bdt.getAuthor());
		c.setPrice(Double.parseDouble( bdt.getPrice()));
		c.setTotal(Double.parseDouble( bdt.getPrice()));
		
		HttpSession sess = request.getSession();
		CartDaoImp cdi = new CartDaoImp(Conpro.getCon());
		boolean f = cdi.addCart(c);
		
		if(f) {
			sess.setAttribute("addmsg", "Book added to cart");
			sess.setAttribute("bid", bid+"");
			System.out.println("Book added to cart successfully");
		}
		
		else {
			sess.setAttribute("fadd", "Book not added to cart");
			System.out.println("Book not added to cart");
		}
		
		
		
		if("new".equalsIgnoreCase(page))
			response.sendRedirect("newBook.jsp");
		else if("recent".equalsIgnoreCase(page))
			response.sendRedirect("recentBook.jsp");
		else if("VIEW".equalsIgnoreCase(page))
			response.sendRedirect("ViewDetail.jsp");
		else {
			response.sendRedirect("index.jsp");
		}
	}

	
}
