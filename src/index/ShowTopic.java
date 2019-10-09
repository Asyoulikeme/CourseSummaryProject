package index;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolsCode.JDBCUntil;

/**
 * Servlet implementation class ShowTopic
 */
@WebServlet("/ShowTopic")
public class ShowTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowTopic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String topic_id = request.getParameter("topic_id");

		JDBCUntil jdbcq = new JDBCUntil();
		ResultSet rs = null;
		
		String sql = "select * from topic where topic_id = ?";
		
		try {
			rs = jdbcq.executeQuery(sql,topic_id);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		try {
			while(rs.next())
			{
				request.setAttribute("topic_id", rs.getInt(1));
				request.setAttribute("topic_title",rs.getString(2));
				request.setAttribute("topic_content",rs.getString(3));
				request.setAttribute("topic_publish_time",rs.getString(4));
				request.setAttribute("topic_active_sum",rs.getInt(5));
				request.setAttribute("topic_user",rs.getString(6));
				request.setAttribute("topic_to_block",rs.getString(7));
				request.setAttribute("topic_reply_sum",rs.getInt(8));
			}

		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				jdbcq.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.getRequestDispatcher("truthTopic.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
