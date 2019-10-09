package comment;

import java.io.IOException;
import java.sql.ResultSet;
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
 * Servlet implementation class Commentsubmit
 */
@WebServlet("/Commentsubmit")
public class Commentsubmit extends HttpServlet {
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
		// get comment msg
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		
		System.out.println("start");
		String replyTime = "";
		SimpleDateFormat timeFormat= new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		Date currentTime = new Date();
		replyTime = timeFormat.format(currentTime);
		
		String replyContent = request.getParameter("topic-content");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String replyUser = (String)session.getAttribute("currentUserName");
		
		String replyTopicId = request.getParameter("topic_id");
		
		System.out.println(replyTime);
		System.out.println(replyContent);
		System.out.println(replyUser);
		System.out.println(replyTopicId);
		
		// jdbc push
		
		JDBCUntil jdbcu = new JDBCUntil();
		ResultSet rs = null;
		
		String sql = "insert into reply(reply_time,reply_content,reply_user,reply_topic_id) values(?,?,?,?)";
		try {
			jdbcu.executeUpdate(sql,replyTime,replyContent,replyUser,replyTopicId);
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
		}
		response.sendRedirect("ShowTopic?topic_id=" + replyTopicId);
		//request.getRequestDispatcher("truthTopic.jsp?topic_id=" + replyTopicId).forward(request, response);
	}

}
