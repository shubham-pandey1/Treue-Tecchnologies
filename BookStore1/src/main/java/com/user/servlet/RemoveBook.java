package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDaoImp;
import com.db.Conpro;

/**
 * Servlet implementation class RemoveBook
 */
public class RemoveBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cid = Integer.parseInt(request.getParameter("cid"));
		CartDaoImp cdi = new CartDaoImp(Conpro.getCon());
		boolean st = cdi.removeBook(cid);
		
		HttpSession session = request.getSession();
		
		if(st)
			session.setAttribute("rsmsg", "Book Removed Successfully");
		else 
			session.setAttribute("rfmsg", "Book not Removed");
		
		response.sendRedirect("cart.jsp");
	}

	
}
