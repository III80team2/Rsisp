<%@page import="javax.websocket.Session"%>
<%@page import="tw.jspwebpage.workshop.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <jsp:useBean id="myCart"
				 class="tw.jspwebpage.workshop.BookFactory"
				 scope="request" />
<%-- 	<jsp:setProperty property="submitType" name="myCart" param="submit" /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Shopping Mall</title>
</head>
<body>

<form action="Mytest" method="post">
<table>
<%
 int index=0;
 for (Book book : myCart.getBookList()) {
 		out.write("<tr><td>"+book.getBookName()+
 				"</td><td>"+book.getBookPrice()+
 				"</td><td>"+book.getBookAuthor()+
 				"</td><td><input type=text name='count"+ index +"' value=''>"+
				"</td><td><input type=submit name='submit' value='add"+ index +"'>"+				
				"</td></tr><br/>");		
 		index++;
 	}
 
%>

</table>
</form>
	
</body>
</html>