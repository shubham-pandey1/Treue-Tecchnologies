package com.dao;

import java.util.List;

import com.entity.BookDet;

public interface BookDao {
	public boolean addBooks(BookDet bdt);
	
	public List<BookDet> getAllBooks();
	public List<BookDet> getSearchBooks(String ch);
	
	public BookDet getBookbyId(int id);
	
	public boolean deleteBooks(int id);

	public boolean updateEditBooks(BookDet bdt);
	
	public List<BookDet> getNewBooks();
	public List<BookDet> getRecentBooks();
	public List<BookDet> getOldBooks();
	public List<BookDet> getAllNewBooks();
	public List<BookDet> getAllRecentBooks();
	public List<BookDet> getAllOldBooks();
	
	public List<BookDet> getMyBook(String email);
}
