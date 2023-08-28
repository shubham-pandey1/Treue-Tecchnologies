package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoImp;
import com.db.Conpro;
import com.entity.User;

/**
 * Servlet implementation class LoginServ
 */

public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			UserDaoImp dao = new UserDaoImp(Conpro.getCon());
			String email, pass,term;
			HttpSession sess = request.getSession();
			
			email = request.getParameter("email");
			pass = request.getParameter("pass");
			term = request.getParameter("term");
			
			if(term != null) {
				User user = dao.login(email, pass);
				
				if(user.getPass() != null && user.getPass().equals(pass)) {
					sess.setAttribute("user", user);
					if(email.equals("admin@gmail.com"))
						response.sendRedirect("admin/home.jsp");
					else response.sendRedirect("index.jsp");
				}
				else {
					sess.setAttribute("failedmsg", "Email or Password is incorrect");
					response.sendRedirect("login.jsp");
				}
				response.sendRedirect("index.jsp");
			}
			else {
				sess.setAttribute("term", "Accept terms and Condition");
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
