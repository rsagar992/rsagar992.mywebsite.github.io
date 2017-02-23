<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medicine Search</title>
<style>
form {
                width:500px;
                margin:50px auto;
}
.search {
                padding:8px 15px;
                background:rgba(50, 50, 50, 0.2);
                border:0px solid #dbdbdb;
}
.button {
                position:relative;
                padding:6px 15px;
                left:-8px;
                border:2px solid #207cca;
                background-color:#207cca;
                color:#fafafa;
}
.button:hover  {
                background-color:#fafafa;
                color:#207cca;
}

</style>
</head>
<body>
<center>This site is to enter price for selected medicines.</center> 
<form action="Searchservlet" method="post">
		<input type="text" class="button" name="medsearch" placeholder="Search..." required>
		<button type="button" class="search">Search</button>
</form>
</body>
</html>