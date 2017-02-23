import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	    HttpSession session=request.getSession(); 
	    String n=request.getParameter("username"); 
	    //System.out.println(n);
	    String p=request.getParameter("password");
	    //System.out.println(p);
	          
	    if(loginver.validate(n, p)){  
	    	out.print("<h3 style='color:black;' align='center'><font face='comic sans MS'>Welcome "+n+"</font></h3>");
	    	session.setAttribute("user",n);  
	        RequestDispatcher rd=request.getRequestDispatcher("search.jsp");   
	        rd.include(request,response);
	    }  
	    else{  
	        out.print("<h3 style='color:black;' align='center'><font face='comic sans MS'>Sorry username and/or password not matched.</font></h3>");  
	        RequestDispatcher rd=request.getRequestDispatcher("login.html");  
	        rd.include(request,response);  
	    }  
	    
	    out.close();  
	}
}
