package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ContactDao;
import com.dao.ContactDaoImp;
import com.db.Conpro;
import com.entity.Contact;

/**
 * Servlet implementation class ContactServ
 */
public class ContactServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name,email,phone,subject,msg;
		
		name = request.getParameter("name");
		email = request.getParameter("email");
		phone = request.getParameter("phone");
		subject = request.getParameter("subject");
		msg = request.getParameter("msg");
		
		Contact con = new Contact(name,email,phone,subject,msg);
		HttpSession sess = request.getSession();
		
		ContactDaoImp cdi = new ContactDaoImp(Conpro.getCon());
		boolean f = cdi.insertViews(con);
		
		if(f) sess.setAttribute("csmsg", "Your feedback submitted Successfully");
		else sess.setAttribute("cfmsg", "Feedback not submitted, try again..");
		
		response.sendRedirect("Contactus.jsp");
	}

}
