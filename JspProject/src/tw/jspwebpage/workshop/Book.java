package tw.jspwebpage.workshop;

import java.io.Serializable;

public class Book implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public Book(String bookName,int bookPrice,String bookAuthor) {
		this.bookName=bookName;
		this.bookPrice=bookPrice;
		this.bookAuthor=bookAuthor;
	}
	
	private String bookName;
	private int bookPrice;
	private String bookAuthor;	

	public String getBookName() {
		return bookName;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}	
	public String toString(){
		
		return "<tr><td>"+bookName+"</td><td>"+bookPrice+"</td><td>"+bookAuthor+"</td><td>";
	}
	
}
