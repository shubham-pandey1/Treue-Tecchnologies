package com.entity;

public class RateDet {
	private int bid,rate, uid;
	private String uname;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "RateDet [bid=" + bid + ", rate=" + rate + ", uid=" + uid + ", uname=" + uname + "]";
	}
	public RateDet() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RateDet(int bid, int rate, int uid, String uname) {
		super();
		this.bid = bid;
		this.rate = rate;
		this.uid = uid;
		this.uname = uname;
	}
	
	
}
