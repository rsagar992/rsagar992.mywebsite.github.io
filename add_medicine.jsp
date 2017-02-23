<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Medicine</title>
<style>
form {
    border: 3px solid Black;
}

.container {
    padding: 16px;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
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
<form action="addindb" method="post">
<h3 style='color:black;' align='center'><font face='comic sans MS'>Add Medicine/s Page</font></h3>
<% 
String name=(String)session.getAttribute("user_d");
out.println("<input type='text' style='background-color:cyan;' name='username' value='"+name+"' readonly>");
%>
<div class="container">
    <input type="text" placeholder="Enter Medicine Class" name="medicine_class" required>
    <input type="text" placeholder="Enter Medicine Name" name="medicine_name" required>
    <input type="text" placeholder="Enter Price" name="price" required>
    <input type="text" placeholder="Enter Stock" name="stock" required>    
    <button type="submit"class="button1" style="vertical-align:middle"><span>Add</span></button>
  </div>
</form>
<a href="index.html"><button type="submit"class="button1" style="vertical-align:middle"><span>Cancel/Back</span></button></a>
</body>
</html>