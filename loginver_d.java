import java.sql.*;
public class loginver_d { 
		public static boolean validate_d(String name,String pass){  
			boolean status=false;
		try{  
		//step1 load the driver class  
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		  
		//step2 create  the connection object  
		Connection con=DriverManager.getConnection(  
		"jdbc:oracle:thin:@localhost:1521:orcl","scott","q512atan");
			PreparedStatement ps=con.prepareStatement("select * from distributor where username=? and password=?");  
			ps.setString(1,name);  
			ps.setString(2,pass);  
			      
			ResultSet rs=ps.executeQuery();  
			status=rs.next();  
			          
			}catch(Exception e){System.out.println(e);}  
			return status; 
		}
	}
