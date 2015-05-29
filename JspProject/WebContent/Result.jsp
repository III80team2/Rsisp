<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	<%
		session.setAttribute("cart", "");
		String cart = (String)session.getAttribute("cart");
		out.write(cart);
	
	%>
	
	<input type="submit" name="submit" value="返回商品頁面"><br/><br/>
</form>
</body>
</html>