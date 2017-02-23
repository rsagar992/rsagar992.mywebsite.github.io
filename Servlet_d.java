

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Servlet_d
 */
@WebServlet("/Servlet_d")
public class Servlet_d extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_d() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	    HttpSession session=request.getSession(); 
	    String n_d=request.getParameter("username"); 
	    System.out.println(n_d);
	    String p_d=request.getParameter("password");
	    System.out.println(p_d);
	          
	    if(loginver_d.validate_d(n_d, p_d)){  
	    	//out.print("<h3 style='color:black;' align='center'><font face='comic sans MS'>Welcome "+n_d+"</font></h3>");
	    	session.setAttribute("user_d",n_d);  
	        RequestDispatcher rd=request.getRequestDispatcher("distributor_catalog.jsp");   
	        rd.include(request,response);
	    }  
	    else{  
	        out.print("<h3 style='color:black;' align='center'><font face='comic sans MS'>Sorry username and/or password not matched.</font></h3>");  
	        RequestDispatcher rd=request.getRequestDispatcher("distributor_login.html");  
	        rd.include(request,response);  
	    }  
	    
	    out.close();  
	}

}
