package comment;

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
 * Servlet implementation class LoadComment
 */
@WebServlet("/LoadComment")
public class LoadComment extends HttpServlet {
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
		
		String topicId = (String)request.getParameter("topic_id");
		
		JDBCUntil jdbcq = new JDBCUntil();
		ResultSet rs = null;
		String sql = "select * from reply where reply_topic_id=?";
		
		try {
			rs = jdbcq.executeQuery(sql, topicId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONArray jsonArray = new JSONArray();
		int i = 0;
		try {
			while(rs.next())
			{	
		
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("reply_id", rs.getInt(1));
				jsonObject.put("reply_time", rs.getString(2));
				jsonObject.put("reply_content", rs.getString(3));
				jsonObject.put("reply_user", rs.getString(4));
				jsonArray.add(i,jsonObject);
				i++;
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
