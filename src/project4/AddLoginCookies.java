package project4;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AddLoginCookies
 */
@WebServlet("/AddLoginCookies")
public class AddLoginCookies extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 数据库中有这个用户的注册记录  就登陆进去 如果 还勾选了记住我 那就保存cookie 
		String username = request.getParameter("userNumber");
		String password = request.getParameter("userPassword");
		System.out.println(username);
		System.out.println(password);
		
		
		if(username != null && password!= null) {
			Cookie uname = new Cookie("userNumber",username);
			Cookie upass = new Cookie("userPassword",password);
			
			uname.setMaxAge(1*60*60*24*30);
			upass.setMaxAge(1*60*60*24*30);
			response.addCookie(uname);
			response.addCookie(upass); 
			System.out.println("add succes!");
			
		}
	}

}
