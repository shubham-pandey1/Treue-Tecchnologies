package com.dao;

import java.util.List;

import com.entity.Cart;

public interface CartDao {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getBookbyUser(int userid);
	
	public boolean removeBook(int cid);
}
