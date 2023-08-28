package com.dao;

import java.util.List;

import com.entity.Order;

public interface OrderDao {
	public boolean placedorder(List<Order> list);
	
	public List<Order> getOrderedBook(int uid);
	
	public List<Order> getAllOrdered();
	
}
