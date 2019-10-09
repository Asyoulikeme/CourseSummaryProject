package project4;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toolsCode.JDBCUntil;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String userNumber = request.getParameter("userNumber");
		String userPassword = request.getParameter("userPassword");
		
		JDBCUntil jdbcu = new JDBCUntil();
		ResultSet rs = null;
		String sql =
				 "select userNumber,userPassword from user where userNumber=?" ;
		try {
			rs = jdbcu.executeQuery(sql, userNumber);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String queriedUserName = "";
		String queriedUserPassword = "";
		try {
			if(rs.next()) 
			{
				queriedUserName = rs.getString("userNumber");
				queriedUserPassword = rs.getString("userPassword");
				if(queriedUserName.equals(userNumber) && queriedUserPassword.equals(userPassword))
				{
					HttpSession session = request.getSession();       // 获取Session对象
					session.setAttribute("currentUserName", userNumber);
					
					response.sendRedirect("person.jsp");
				}
				else 
				{
					request.setAttribute("msg", "账号或密码错误");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}
			else
			{
				request.setAttribute("msg", "用户未注册");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally 
		{
			try {
				jdbcu.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}

