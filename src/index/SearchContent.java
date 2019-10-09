package index;

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
 * Servlet implementation class SearchContent
 */
@WebServlet("/SearchContent")
public class SearchContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String topicToBlock = request.getParameter("topic_to_block");
		
		JDBCUntil jdbcq = new JDBCUntil();
		String sql = "select * from topic where topic_to_block = ?";
		ResultSet rs = null;
		
		try {
			rs = jdbcq.executeQuery(sql, topicToBlock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONArray jsonArray = new JSONArray();
		
		try {
			while(rs.next()) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("topic_id", rs.getInt(1));
				jsonObject.put("topic_title", rs.getString(2));
				jsonObject.put("topic_content", rs.getString(3));
				jsonObject.put("topic_publish_time", rs.getString(4));
				jsonObject.put("topic_user", rs.getString(6));
				jsonObject.put("topic_to_block", rs.getString(7));
				jsonArray.add(jsonObject);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
