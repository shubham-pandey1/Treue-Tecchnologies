package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RateDetDao;
import com.dao.RateDetDaoImp;
import com.db.Conpro;
import com.entity.RateDet;
import com.entity.User;

/**
 * Servlet implementation class RatingServ
 */
public class RatingServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatingServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sess = request.getSession();
		User user = (User)sess.getAttribute("user");
		int val,bid,uid;
		val = Integer.parseInt(request.getParameter("stars"));
		bid = Integer.parseInt((String)(sess.getAttribute("bid1")));
		RateDet rd = new RateDet(bid,val, user.getId(), user.getName());
		
		RateDetDaoImp rdi = new RateDetDaoImp(Conpro.getCon());
		boolean f = rdi.insertRate(rd);
		System.out.println(f + " " + rd);
		
		HttpSession sess1 = request.getSession();
		
		sess1.setAttribute("bid", bid+"");
		if(f) sess1.setAttribute("fsmsg", "Feedback is Submitted");
		else sess1.setAttribute("ffmsg", "Feedback is not Submitted");
		
		response.sendRedirect("ViewDetail.jsp");
	}


}
