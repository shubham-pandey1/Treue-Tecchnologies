package com.dao;

import com.entity.*;

public interface UserDao {
	
	public boolean userRegister(User user);
	public User login(String email, String pass);
	
	public boolean updatePofile(int uid, String name, String email, String phone);
	
	public boolean checkUser(String email);
}
