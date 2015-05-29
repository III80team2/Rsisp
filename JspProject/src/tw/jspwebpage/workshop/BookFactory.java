package tw.jspwebpage.workshop;

import java.io.Serializable;
import java.util.ArrayList;

public class BookFactory implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public BookFactory() {
		setBooks();
	}
	
	private Book book;
	private ArrayList<Book> bookList = new ArrayList<Book>();
	Book book6=new Book("JSP",10000,"Jeremy");
		
	public void setBooks() {
		Book book1=new Book("JSP",10000,"Jeremy");
		Book book2=new Book("Java",9999,"Leon");
		Book book3=new Book("JavaScript",5000,"Lin");
		Book book4=new Book("Android",100,"Tsai");
		Book book5=new Book("iOS",1000,"Wei");
		
		bookList.add(book1);
		bookList.add(book2);
		bookList.add(book3);
		bookList.add(book4);
		bookList.add(book5);
	}	
	
	public Book getBooks(){
		return bookList.get(0);
	}
		
	public ArrayList<Book> getBookList() {
		return bookList;
	}	
	//private String submitType;
	private ArrayList<Book> cartList = new ArrayList<Book>();
	

	public void processShoppingCart(String submitType,int index) {
		if (submitType == null || submitType.equals("add"+index)) {
			addItem(bookList.get(index));
		} else if (submitType.equals("delete")) {
			removeItem(book6);
		}

		submitType = null;
		book = null;
	}

	
	private void addItem(Book book) {
		cartList.add(book);		
	}

	
	private void removeItem(Book book) {
		cartList.remove(book);
	}

	
	public ArrayList<Book> getCartList() {
		return cartList;
	}

}
