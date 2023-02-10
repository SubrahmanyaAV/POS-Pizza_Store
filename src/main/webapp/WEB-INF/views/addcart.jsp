<%@page import="java.time.LocalDate"%>
<%@page import="com.cruds.pos.bean.FoodBean"%>
<%@page import="java.util.List"%>
<%@page import="com.cruds.pos.bean.Cart"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/pos/static/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<link href="/pos/static/css/stylesheet/cart.css" rel="stylesheet"
	type="text/css">
<title>Cart Page</title>
</head>
<body class="bg-image"
	style="background-image: url('/pos/static/images/bg_4.jpg'); background-size: 100%; background-repeat: no-repeat; background-attachment: fixed;">
	<div class="text" align="center" style="margin-top: 100px;"></div>
	<div class="hello">
		<a href="#"><img src="/pos/static/images/logo.png"></a>
	</div>
	<nav>
	<ul class="nav-list">
		<li class="nav-items"><a href="/"></a></li>
		<li class="nav-items"><a href="home.html">Home</a></li>
		<li class="nav-items"><a href="abouthome.html">About</a></li>
		<!-- <li class="nav-items"><a href="/">Services</a></li>
			<li class="nav-items"><a href="/">Career</a></li> -->
		<li class="nav-items"><a href="contacthome.html">Contact</a></li>
	</ul>
	</nav>

	<%
		Cart cart = (Cart) session.getAttribute("CART");
		List<FoodBean> list = cart.getList();
	%>
	<br />
	<br />

	<table class="table table-hover table-dark">
		<thead>
			<tr>
				<td style="color: white;">Food ID</td>
				<td style="color: white;">name</td>
				<td style="color: white;">Type</td>
				<td style="color: white;">Size</td>
				<td style="color: white;">Quantity</td>
				<td style="color: white;">Price</td>
				<td style="color: white;">orderDate</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(FoodBean fb : list){
			%>
			<tr>
				<td style="color: white;"><%= fb.getFoodID() %></td>
				<td style="color: white;"><%= fb.getName()%></td>
				<td style="color: white;"><%= fb.getFoodtype()%></td>
				<td style="color: white;"><%= fb.getFoodSize()%></td>
				<td style="color: white;"><%= fb.getFoodQuantity()%></td>
				<td style="color: white;"><%= fb.getPrice()%></td>
				<td style="color: white;"><%= java.time.LocalDate.now()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<p style="color: white;">
		Total
		<%= cart.getTotal() %></p>

	<a href="addorder.html" class="button">Place Order</a>
	<br>
	<br>

</body>
</html>