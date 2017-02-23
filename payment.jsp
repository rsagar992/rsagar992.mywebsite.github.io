<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Page</title>
<style>
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
<form action="search.jsp">
<%
String med_search=(String)session.getAttribute("medsearch");

out.println("<h1 align='center'><strong>Sorry...payment gateway not found.</strong></h1>");
out.println("<button type='submit' class='button1' style='vertical-align:middle'><span>Cancel/Back</span></button>");
%>
</form>
</body>
</html>