package com.user.servlet;

import java.awt.Checkbox;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.*;
import com.db.*;
import com.entity.*;

/**
 * Servlet implementation class RegisterServletj
 */

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
			PrintWriter pw = response.getWriter();
			String name,phone,pass,email,term;
			name = request.getParameter("name");
			email = request.getParameter("email");
			phone = request.getParameter("phone");
			pass = request.getParameter("pass");
			term = request.getParameter("term");
			
			
			
			HttpSession sess = request.getSession();
			
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPass(pass);
			user.setPhone(phone);
			
			Connection con = null;
				
			
			con = Conpro.getCon();
			System.out.println(con);
			
			UserDaoImp usdi = new UserDaoImp(con); 
			boolean pro = usdi.checkUser(email);
			System.out.println(pro);
			if(pro) {
				sess.setAttribute("exist", "This email is already exists try another email");
				response.sendRedirect("register.jsp");
			}
			else {
			if(term != null ) {
				
			boolean f = usdi.userRegister(user);
			System.out.println(f);
			if(f){
				
				sess.setAttribute("serv", "Registered Sucessfully");
				
			}
			else {
				sess.setAttribute("fserv","There is an error occured....");
			}
				
			}
			else {
				sess.setAttribute("fserv", "Please check the box");
			}
			response.sendRedirect("register.jsp");
	}
	}
}
