package person;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import toolsCode.JDBCUntil;

/**
 * Servlet implementation class GetPersonInfo
 */
@WebServlet("/GetPersonInfo")
public class GetPersonInfo extends HttpServlet {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String userNumber = request.getParameter("userNumber");
		
		JDBCUntil jdbcq = new JDBCUntil();
		ResultSet rs = null;
		String sql = "select * from user where userNumber = ?";
		
		try {
			rs = jdbcq.executeQuery(sql, userNumber);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONArray jsonArray = new JSONArray();
		try {
			while(rs.next()) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("user_name",rs.getString(3));
				jsonObject.put("user_sex",rs.getString(4));
				jsonObject.put("user_email",rs.getString(5));
				jsonObject.put("user_head_img",rs.getString(6));
				jsonObject.put("user_self_talk",rs.getString(7));
				jsonArray.add(jsonObject);
			}
			
			rs = null;
			sql = null;
			
			sql = "select count(*) from topic where topic_user = ?";
			
			rs = jdbcq.executeQuery(sql, userNumber);
			
			if(rs.next())
			{
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("topic_num", rs.getInt(1));
				jsonArray.add(jsonObject);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				jdbcq.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		PrintWriter out = response.getWriter();
		out.print(jsonArray.toString());
		out.flush();
		out.close();
	}

}
