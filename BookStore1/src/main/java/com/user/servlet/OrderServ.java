package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDaoImp;
import com.dao.OrderDaoImp;
import com.db.Conpro;
import com.entity.Cart;
import com.entity.Order;
import com.entity.User;

/**
 * Servlet implementation class OrderServ
 */
public class OrderServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name,email,phone,address,landmark,city,state,zip,paymode;
		name = request.getParameter("name");
		email = request.getParameter("email");
		phone = request.getParameter("phone");
		address = request.getParameter("address");
		landmark = request.getParameter("lmark");
		city = request.getParameter("city");
		state = request.getParameter("state");
		zip = request.getParameter("zip");
		paymode = request.getParameter("mode");
		address += ", "+ city+ ", "+ state+", "+ landmark+", " +zip; 
		
		
		int uid,size = 0;
		HttpSession sess = request.getSession();
		User user = (User)sess.getAttribute("user");
		if(!paymode.equals("cash"))
		{
			sess.setAttribute("mode", "Please select Payment mode");
			response.sendRedirect("cart.jsp");
		}
		else {
		uid = user.getId();
		List<Order> list = new ArrayList<Order>();
		CartDaoImp cdi = new CartDaoImp(Conpro.getCon());
		List<Cart> list1 = cdi.getBookbyUser(uid);
		size = list1.size();
		if(size<1) {
			sess.setAttribute("ecart", "Your cart is empty");
			response.sendRedirect("cart.jsp");
		}
		else {
		for(Cart c: list1) {
			Order od = new Order();
			od.setCid(c.getCid());
			od.setUid(c.getUid());
			od.setUname(name);
			od.setEmail(email);
			od.setAddress(address);
			od.setPhone(phone);
			od.setBookname(c.getBookname());
			od.setAuthor(c.getAuthor());
			od.setPrice(c.getPrice() +"");
			od.setPayment(paymode);
			
			list.add(od);
		}
		OrderDaoImp odi = new OrderDaoImp(Conpro.getCon());
		boolean f = odi.placedorder(list);
		
		if(f) {
			System.out.println(f);
			response.sendRedirect("successorder.jsp");
		}
		else {
			sess.setAttribute("ofmsg", "Your order is not placed");
			response.sendRedirect("cart.jsp");
		}
		
		}
		
	}
	}
}

