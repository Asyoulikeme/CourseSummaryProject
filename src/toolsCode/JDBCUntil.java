package toolsCode;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;

	import java.sql.Statement;
	public class JDBCUntil{
		
		private final static String DIRVER = "com.mysql.cj.jdbc.Driver";
		private final static String SQL_URL = "jdbc:mysql://localhost:3306/learntest?serverTimezone=GMT%2B8";
		private final static String USER_NAME = "root";
		private final static String USER_PASSWORD = "123456";
		
		private Connection conn = null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
		
		public JDBCUntil() {
			getConncetion();
		}
		
		public void getConncetion() {
			// 加载驱动
			try {
				Class.forName(DIRVER);
				//获取数据库链接
				conn = DriverManager.getConnection(SQL_URL,USER_NAME,USER_PASSWORD);
			} 
			catch (ClassNotFoundException e)
			{
				e.printStackTrace();
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			
		}
		
		public ResultSet executeQuery(String sql,Object ... params) throws SQLException {
			stmt = conn.prepareStatement(sql);
			for(int i = 0 ; i < params.length ; i++) 
			{
				stmt.setObject(i+1,params[i]); 
			}
			rs = stmt.executeQuery();
			return rs;
		}
		public int executeUpdate(String sql,Object ... params) throws SQLException {
			stmt = conn.prepareStatement(sql);
			for(int i = 0 ; i < params.length ; i++) 
			{
				stmt.setObject(i+1,params[i]); 
			}
			return stmt.executeUpdate();
			
		}
		public void execute(String sql) throws SQLException {
			stmt = conn.prepareStatement(sql);
		}
		public void close() throws SQLException {
			if(rs!=null)
			{
				rs.close();
			}
			if(stmt!=null)
			{
				stmt.close();
			}
			if(conn!=null)
			{
				conn.close();
			}
		
		
		}


	

}
