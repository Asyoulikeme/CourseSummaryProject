package listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class UserCountListener
 *
 */
@WebListener
public class UserCountListener implements HttpSessionListener {
	private int currentUserNum = 0;
    /**
     * Default constructor. 
     */
    public UserCountListener() {
        // TODO Auto-generated constructor stub
    	
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se) {
        // TODO Auto-generated method stub
    	HttpSession session = se.getSession();
    	session.getServletContext().setAttribute("userCount", ++currentUserNum);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se) {
        // TODO Auto-generated method stub
    	HttpSession session = se.getSession();
 
    	session.getServletContext().setAttribute("userCount", --currentUserNum);
    	
    }
	
}
