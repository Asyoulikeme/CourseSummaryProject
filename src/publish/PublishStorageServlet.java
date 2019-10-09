package publish;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toolsCode.JDBCUntil;

/**
 * Servlet implementation class PublishStorageServlet
 */
@WebServlet("/PublishStorageServlet")
public class PublishStorageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */


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
		/*get form  value*/
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		String topicToBlock = request.getParameter("topic-block");
		String topicTitle = request.getParameter("topic-title");
		String topicContent = request.getParameter("topic-content");
		
		Date time = new Date();
		SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String topicPublishTime = timeformat.format(time);
		
		HttpSession session = request.getSession();
		String topicUser = (String)session.getAttribute("currentUserName");
/*
		System.out.println("标题是:" + topicTitle);
		System.out.println("内容是:" + topicContent);
		System.out.println("所属:" + topicToBlock);
		System.out.println("发表时间:" + topicPublishTime);
		System.out.println("发表用户:" + topicUser);
		*/
		
		JDBCUntil jdbcp = new JDBCUntil();
		String createSql = "insert into topic(topic_title,topic_content,topic_to_block,topic_publish_time,topic_user)"
				+ "values(?,?,?,?,?)";
		try {
			jdbcp.executeUpdate(createSql, topicTitle,topicContent,topicToBlock,topicPublishTime,topicUser);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally 
		{
			try {
				jdbcp.close();
				response.sendRedirect("person.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// java 输入输出流 保存 帖子实例
		
	}

}
