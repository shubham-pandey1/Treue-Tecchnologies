package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImp;
import com.db.Conpro;
import com.entity.BookDet;

/**
 * Servlet implementation class DeleteBook
 */
public class DeleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBook() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String fr;
			int id = Integer.parseInt(request.getParameter("id"));
			fr = request.getParameter("fr");
			
			
			
			BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
			boolean f = bdi.deleteBooks(id);
			HttpSession sess = request.getSession();
			
			if(f) {
				sess.setAttribute("smsg", "Book Deleted");
			}
			else sess.setAttribute("fmsg", "There is error in deleting");
			if(fr.equals("all"))
			response.sendRedirect("admin/allbooks.jsp");
			else {
				response.sendRedirect("MyBook.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
