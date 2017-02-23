<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Catalog</title>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 18px;
  padding: 10px;
  width: 100%;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

.button1 {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 18px;
  padding: 10px;
  width: 100%;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button1 span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button1 span:after {
  content: '\00ab';
  position: absolute;
  opacity: 0;
  top: 0;
  left: -20px;
  transition: 0.5s;
}

.button1:hover span {
  padding-left: 25px;
}

.button1:hover span:after {
  opacity: 1;
  left: 0;
}

</style>
</head>
<body>
<form action="add_medicine.jsp">
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%   

String name=(String)session.getAttribute("user_d"); 
String medicine_class,medicine_name,price,stock;
out.print("<h3 style='color:black;' align='center'><font face='comic sans MS'>Welcome "+name+"</font></h3>");

try{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:orcl","scott","q512atan");
		PreparedStatement ps=con.prepareStatement("select medicine_class,medicine_name,price,stock from catalog where username='"+name+"'");  		      
		ResultSet rs=ps.executeQuery();
		int i=0;
		out.println("<table style='width:100%'><tr><th>Medicine Class : </th><th>Medicine Name : </th><th>Stock : </th><th>Price : </th></tr>");
		while(rs.next())
		{
			i++;
			medicine_class=rs.getString("medicine_class");
			medicine_name=rs.getString("medicine_name");
			price=rs.getString("price");
			stock=rs.getString("stock");
			//out.println("<table style='width:100%'><tr><th>Distributor Name : <td>"+username+"</td><th>Medicine Name : <td>"+medicine_name+"</td><th>Stock : <td>"+stock+"</td><th>Price : <td>"+price+"</td></th></tr></table>");
			out.println("<tr><td>"+medicine_class+"</td><td>"+medicine_name+"</td><td>"+stock+"</td><td>"+price+"</td></tr>");
		}
		out.println("</table>");
		out.print("<h5 align='center'><strong>Found "+i+" medicine/s sold by "+name+".</strong></h5>");
		}catch(Exception e){System.out.println(e);}


out.print("<button type='submit' class='button' style='vertical-align:middle'><span>--Add Medicine/s--</span></button>");
%>
</form>
<a href="distributor_login.html"><button type='submit' class='button1' style='vertical-align:middle'><span>Cancel/Back</span></button></a>
</body>
</html>