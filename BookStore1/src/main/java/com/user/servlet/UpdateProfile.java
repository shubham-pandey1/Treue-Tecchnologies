package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoImp;
import com.db.Conpro;
import com.entity.User;

/**
 * Servlet implementation class UpdateProfile
 */
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name,email,phone,pass;
		HttpSession sess = request.getSession();
		HttpSession sess1 = request.getSession();
		User user = (User)sess.getAttribute("user");
		
		name = request.getParameter("name");
		email = request.getParameter("email");
		phone = request.getParameter("phone");
		pass = request.getParameter("pass");
		
		if(pass.equals(user.getPass())) {
			UserDaoImp udi = new UserDaoImp(Conpro.getCon());
			boolean f = udi.updatePofile(user.getId(), name, email, phone);
			if(f) 
				sess1.setAttribute("esmsg", "Profile update Sucessfully");
			else sess1.setAttribute("efmsg", "Profile not Updated");
		}
		else sess1.setAttribute("epmsg", "Password is incorrect");
		
		response.sendRedirect("EditProfile.jsp");
	}

}
