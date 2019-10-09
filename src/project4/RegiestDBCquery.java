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
 * Servlet implementation class RegiestDBCquery
 */
@WebServlet("/RegiestDBCquery")
public class RegiestDBCquery extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	private final static int PRIMARYKEY = 1;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegiestDBCquery() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		// 获取前台数据
				String userNumber = request.getParameter("userNumber");
				String userPassword = request.getParameter("userPassword");
				// 数据库查询
				JDBCUntil jdbcu = new JDBCUntil();
				String sql ="insert into user(userNumber,userPassword) values(?,?)";
				int w = 0;
						try {
							w = jdbcu.executeUpdate(sql, userNumber,userPassword);
						}
						catch (SQLException e)
						{
							e.printStackTrace();
						}
						finally 
						{
							try {
								jdbcu.close();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						if(w != 0) {
							HttpSession session = request.getSession();       // 获取Session对象
							session.setAttribute("currentUserName", userNumber);
							response.sendRedirect("person.jsp");
						}
	}
}
