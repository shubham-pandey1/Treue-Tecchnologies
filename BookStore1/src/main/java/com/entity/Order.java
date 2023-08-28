package com.entity;

public class Order {
	private int soid,uid,cid;
	private String uname,email,address,phone,bookname,author,price,payment;
	
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSoid() {
		return soid;
	}
	public void setSoid(int soid) {
		this.soid = soid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	@Override
	public String toString() {
		return "Order [soid=" + soid + ", uid=" + uid + ", cid=" + cid + ", uname=" + uname + ", email=" + email
				+ ", address=" + address + ", phone=" + phone + ", bookname=" + bookname + ", author=" + author
				+ ", price=" + price + ", payment=" + payment + "]";
	}
	
}
