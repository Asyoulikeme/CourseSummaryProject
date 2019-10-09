package person;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolsCode.JDBCUntil;

/**
 * Servlet implementation class Modify
 */
@WebServlet("/Modify")
public class Modify extends HttpServlet {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String userNumber = request.getParameter("currentUserNumber");
		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		String userSex = request.getParameter("sex_radio");
		String selfIntroduce = request.getParameter("selfIntroduce");
		
		JDBCUntil jdbcu = new JDBCUntil();
		String sql = "update user set user_name=?,user_sex=?,user_email=?,user_self_talk=? where userNumber=?";
		try {
			jdbcu.executeUpdate(sql, userName,userSex,userEmail,selfIntroduce,userNumber);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				jdbcu.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("person.jsp");
		}
	}

}
