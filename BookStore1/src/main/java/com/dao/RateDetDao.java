package com.dao;
import com.entity.*;
import java.util.List;

public interface RateDetDao {
	public boolean insertRate(RateDet rd);
	public List<RateDet> getRate(int bid);
}
