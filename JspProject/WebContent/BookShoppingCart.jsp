<%@page import="java.util.ArrayList"%>
<%@page import="tw.jspwebpage.workshop.Book"%>
<%@page import="tw.jspwebpage.workshop.BookFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="myCart"
	class="tw.jspwebpage.workshop.BookFactory"
	scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="BookShoppingMall.jsp" method="post">
<input type="submit" name="submit" value="返回商品頁面"><br/><br/>
	<%
	String submitType = request.getParameter("submit");
	String sIndex = submitType.substring(3);
	int index = Integer.parseInt(sIndex);
	
	BookFactory factory = new BookFactory();
	
	factory.processShoppingCart(submitType,index);
	String result = factory.getCartList().get(0).toString();
	
	session.setAttribute("cart", result+"<br/>");
	session.putValue("a", result+"<br/>");
	out.print(result+"<br/>");
	%>
	
</form>
<form action="Result.jsp">
	<input type="submit" name="submit" value="結束訂購"><br/><br/>

</form>
</body>
</html>