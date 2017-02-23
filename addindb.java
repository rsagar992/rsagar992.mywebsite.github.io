import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addindb
 */
@WebServlet("/addindb")
public class addindb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addindb() {
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
		String name=request.getParameter("username");
		System.out.println(name);
		String medicine_class,medicine_name,price,stock;
		int c = 0;
		medicine_class=request.getParameter("medicine_class");
		medicine_class.toLowerCase();
		medicine_name=request.getParameter("medicine_name");
		medicine_name.toLowerCase();
		price=request.getParameter("price");
		price.toLowerCase();
		stock=request.getParameter("stock");
		stock.toLowerCase();
	try{  
		//step1 load the driver class  
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		  
		//step2 create  the connection object  
		Connection con=DriverManager.getConnection(  
		"jdbc:oracle:thin:@localhost:1521:orcl","scott","q512atan");
			PreparedStatement ps=con.prepareStatement("select count(medicine_name) from catalog where username='"+name+"' and medicine_name='"+medicine_name+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				c=rs.getInt("count(medicine_name)");
				System.out.println(c);
			}
			if(c>0)
			{
				out.println("<h3 style='color:black;' align='center'><font face='comic sans MS'>"+medicine_name+" has already been added by you.</font></h3>");
	        	RequestDispatcher rd=request.getRequestDispatcher("add_medicine.jsp");   
	        	rd.include(request,response);
			}
			else
			{
			//String pass=rs.getString("password");
			//System.out.println(pass);*/
			Statement stmt=con.createStatement();
			int i=stmt.executeUpdate("insert into catalog values ('"+name+"','"+medicine_class+"','"+medicine_name+"',"+price+","+stock+")");  
			if(i>0)
			{
				out.println("<h3 style='color:black;' align='center'><font face='comic sans MS'>"+medicine_name+" added successfully.</font></h3>");
	        	RequestDispatcher rd=request.getRequestDispatcher("add_medicine.jsp");   
	        	rd.include(request,response);
			}
			else
			{
				out.println("<h3 style='color:black;' align='center'><font face='comic sans MS'>Add Unsuccessful</font></h3>");
				RequestDispatcher rd1=request.getRequestDispatcher("distributor_login.jsp");   
	        	rd1.include(request,response);
			}
			}
			}catch(Exception e){System.out.println(e);}
	}

}
