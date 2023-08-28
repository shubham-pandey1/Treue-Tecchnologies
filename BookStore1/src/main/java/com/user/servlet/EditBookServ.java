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
 * Servlet implementation class EditBookServ
 */
public class EditBookServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBookServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String bname, author, price, status, fr;
			int id = Integer.parseInt(request.getParameter("bookid"));
			bname = request.getParameter("bname");
			author = request.getParameter("aname");
			price = request.getParameter("price");
			status = request.getParameter("status");
			
			
			BookDet bdt = new BookDet();
			bdt.setAuthor(author);
			bdt.setBookname(bname);
			bdt.setPrice(price);
			bdt.setStatus(status);
			bdt.setBookID(id);
			
			BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
			boolean f = bdi.updateEditBooks(bdt);
			HttpSession sess = request.getSession();
			
			if(f) {
				sess.setAttribute("smsg", "Details updated Sucessfully");
				
			}
			else sess.setAttribute("fmsg", "There is error in updating values");
			sess.setAttribute("oid", id+"");
			response.sendRedirect("admin/editbook.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
