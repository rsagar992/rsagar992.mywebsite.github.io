<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medicine Search</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<form action="med_search_result.jsp">
<h5 align="center"><strong>Search for medicine availability with different distributors.</strong></h5>
<div class="center">
<input type="text" class="text" name="medsearch" style="vertical-align:middle" placeholder="Medicine Name..." autocomplete="on" required>
<button type="submit" class="button" style="vertical-align:middle"><span>Search</span></button>

</div>
</form>
<div class="center">
<a href="index.html"><button type="submit" class="button1" style="vertical-align:middle"><span>Cancel/Back</span></button></a>
</div>
</br></br><br/><br/><br/>
<p><h5 align="center"><strong>Exclusive option for Retailers to exchange their medicines with different retailers.</strong></h5></p>
<div class="center">
<a href="exchange.jsp"><button type="submit" class="buttong" style="vertical-align:middle"><span>Exchange</span></button></a>

</div>
</body>
</html>