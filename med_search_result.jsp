<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Result</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
table, th, td {
    border-bottom: 2px #58595Bd black;
        border-bottom-width: 2px;
        border-bottom-style: dashed;
        border-bottom-color: rgb(88, 89, 91);
    border: 2px dashed black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}


</style>
</head>
<body>
<form action="payment.jsp">
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%   
String med_search=request.getParameter("medsearch");
session.setAttribute("medsearch",med_search);
String name=(String)session.getAttribute("user"); 
System.out.println("med_search: "+med_search);
String med=request.getParameter("medsearch");
String str=new String(med);
str=str.toLowerCase();
System.out.println("str: "+str);
String username,medicine_name,price,stock;
out.print("<h3 style='color:black;' align='center'><font face='comic sans MS'>Welcome "+name+"</font></h3>");

try{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:orcl","scott","q512atan");
		PreparedStatement ps=con.prepareStatement("select username,medicine_name,price,stock from catalog where medicine_name like'"+str+"%' order by price,username asc");  		      
		ResultSet rs=ps.executeQuery();
		int i=0,k=0,j=0;
		String[] s=new String[100];
		out.println("<table style='width:100%'><tr><th>No.</th><th>Medicine Name : </th><th>Distributor Name : </th><th>Stock : </th><th>Price : </th></tr>");
		while(rs.next())
		{
			username=rs.getString("username");
			s[i]=username;
			System.out.println("s[i]:"+s[i]);
			i++;
			System.out.println("i:"+i);
			medicine_name=rs.getString("medicine_name");
			price=rs.getString("price");
			stock=rs.getString("stock");
			//out.println("<table style='width:100%'><tr><th>Distributor Name : <td>"+username+"</td><th>Medicine Name : <td>"+medicine_name+"</td><th>Stock : <td>"+stock+"</td><th>Price : <td>"+price+"</td></th></tr></table>");
			out.println("<tr><td><input type='radio' name='"+med+"' value='"+i+"' required></td><td>"+medicine_name+"</td><td>"+username+"</td><td>"+stock+"</td><td>"+price+"</td></tr>");
		}
		out.println("</table>");
		for(j=0;j<i;j++)
		{
			if(s[j].equalsIgnoreCase(s[j+1]))
			{
				System.out.println(s[j]);
			}
			else
			{
				k++;
			System.out.println("k:"+k);
			}
		}
		out.print("<h5 align='center'><strong>Found "+k+" distributor/s who sell this/these product/s.</strong></h5>");
		}catch(Exception e){System.out.println(e);}


out.print("<button type='submit' class='button' style='vertical-align:middle'><span>--BUY--</span></button>");
%>
</form>
<a href="search.jsp"><button type='submit' class='button1' style='vertical-align:middle'><span>Cancel/Back</span></button></a>
</body>
</html>