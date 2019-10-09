  package project4;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolsCode.JDBCUntil;

/**
 * Servlet implementation class AjaxFormCheck
 */
@WebServlet("/AjaxFormCheck")
public class AjaxFormCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFormCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNumber = request.getParameter("userNumber");

		
		JDBCUntil jdbcu = new JDBCUntil();
		ResultSet rs = null;
		PrintWriter out = response.getWriter();
		String sql =
				 "select userNumber from user where userNumber=?" ;
		try {
			rs = jdbcu.executeQuery(sql, userNumber);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String queriedUserName = "";
		try {
			if(rs.next()) 
			{
				queriedUserName = rs.getString("userNumber");
				if(queriedUserName.equals(userNumber))
				{
					out.print("isExist");
					out.flush();
					out.close();
				}

			}else{
				out.print("true");
				out.flush();
				out.close();
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
