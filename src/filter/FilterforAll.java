package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class FilterforAll
 */

@WebFilter(filterName="FilterforAll",urlPatterns="/*")
public class FilterforAll implements Filter {

    /**
     * Default constructor. 
     */
    public FilterforAll() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		
		String status = (String)session.getAttribute("currentUserNumber");
		
		boolean pass = (path.contains(".jsp") == false) ; // 只拦截jsp  不是 jsp的都放行
		
		String [] noFilter = {"regiest.html","index.jsp","login.jsp","person.jsp","modify.jsp","add.jsp"};
		for(String s : noFilter) 
		{
			if(path.contains(s))
			{
				pass = true;
			}
		}
		if(status !=null || pass) // 用户状态不为空 与 放行的成员 
		{
			chain.doFilter(request, response);
		}

		else
		{
			HttpServletResponse resp = (HttpServletResponse)response;
			PrintWriter out = response.getWriter();
			out.print("没有权限访问，请先<a href=" + "\'./topic/index.jsp\'" + ">登陆</a>");
			out.flush();
			out.close();
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
