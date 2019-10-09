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
 * Servlet implementation class TopicCount
 */
@WebServlet("/TopicCount")
public class TopicCount extends HttpServlet {
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
		
		JDBCUntil jdbcq = new JDBCUntil();
		String sql = "select topic_id,topic_title,topic_user,topic_publish_time,topic_to_block from topic limit ?,?";
		ResultSet rs = null;
		ResultSet countRs = null;
		String startString = (String)request.getParameter("start");
		String stopString = (String)request.getParameter("stop");
		int start = 0;
		int stop = 5;
		if(startString != null && stopString != null) 
		{
			start = Integer.parseInt(startString);
			stop = Integer.parseInt(stopString);
		}

		//System.out.println(start);
		//System.out.println(stop);
		// 要把数据从数据库中查询出来   id 标题   姓名   时间
			int id = 0;
			String title = "";
			String user = "";
			String publishTime = "";
			String toBlock = "";
			
		PrintWriter out = response.getWriter();
		try {
			rs = jdbcq.executeQuery(sql,start,stop);
			int count = 0;
			int i = 0;
			
			
			JSONArray jsonArray = new JSONArray();
			while(rs.next()) 
			{	
				id = rs.getInt(1);
				title = rs.getString(2);
				user = rs.getString(3);
				publishTime = rs.getString(4);
				toBlock = rs.getString(5);
				count++;
				
				JSONObject jsonText = new JSONObject();
				jsonText.put("id", id);
				jsonText.put("title", title);
				jsonText.put("user", user);
				jsonText.put("publishTime", publishTime);
				jsonText.put("toBlock", toBlock);
				
				jsonArray.add(i, jsonText);
				i++;
			}
			sql = "select count(*) from topic";
			rs = jdbcq.executeQuery(sql); // 这里获取数据条数 加入 json 传给前台 来判断分几页
			JSONObject num = new JSONObject();
			rs.next();
			num.put("count", rs.getInt(1));
			jsonArray.add(i,num);


			
			System.out.println("有 " + count + " 条数据");
			System.out.println(jsonArray.toString());
			out.print(jsonArray.toString());
			out.flush();
			out.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			try {
				jdbcq.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
