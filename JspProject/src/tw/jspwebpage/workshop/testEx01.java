package tw.jspwebpage.workshop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/testEx01")
public class testEx01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
	private String cart;
	private String submitType;
	private String count;
	private String sIndex;
	private int index;
	private BookFactory factory;
	private Integer countSession;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		submitType = request.getParameter("submit");
		sIndex = submitType.substring(3);
		index = Integer.parseInt(sIndex);
		count = request.getParameter("count"+index);
		factory = new BookFactory();
		HttpSession sess = request.getSession(true);
		cart = (String)sess.getAttribute("cart");
		countSession = (Integer)sess.getAttribute("totalCount");
		if(cart == null){
			cart = new String();
		}
		if(countSession == null){
			countSession = new Integer(0);
		}
		factory.processShoppingCart(submitType,index);
		String result = factory.getCartList().get(0).toString();
		cart = cart+result;
		countSession = countSession + Integer.parseInt(count);
		sess.setAttribute("cart", cart+"</td><td>"+count+"個"+
				"</td><td><input type=submit name='delete' value='刪除'>"+"</td></tr><br/>");
		sess.setAttribute("totalCount", countSession);
		response.setContentType("text/html;charset=UTF-8");
		out = response.getWriter();
		cart = (String)sess.getAttribute("cart");
		countSession = (Integer)sess.getAttribute("totalCount");
		
		
		out.print("購物清單:<br/>");
		out.print("<table>"+cart+"</table>");
		out.print("總數量:"+"<br/>"+countSession+"<br/>");
		out.println("<a href = \"BookShoppingMall.jsp\">繼續挑選</a>");
		out.println("<a href = \"Result.jsp\">結束選購</a>");
		out.close();
		
	}

}
