<%@page import="com.cruds.pos.bean.FoodBean"%>
<%@page import="java.util.List"%>
<%@page import="com.cruds.pos.bean.Cart"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.cruds.pos.form.CartFormBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/pos/static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="/pos/static/css/stylesheet/cart.css" rel="stylesheet" type="text/css">
<title>Cart Page</title>
</head>
<body>

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
</body>
<body class="bg-image" style="background-image: url('/pos/static/images/bg_4.jpg'); background-size: 100%; background-repeat: no-repeat;background-attachment: fixed;">
<div class="text" align="center" style="margin-top: 100px;">
<body>

	<%
		Cart cart = (Cart) session.getAttribute("CART");
		List<FoodBean> list = cart.getList();
//		LocalDate orderDate = (LocalDate)session.getAttribute("orderDate");
	%>


	<h3 style="color: white;">Cart</h3>

<%-- 	<table border="1">
		<thead>
			<tr>
				<td style="color: white;">Food ID</td>
				<td style="color: white;">Name</td>
				<td style="color: white;">Type</td>
				<td style="color: white;">Quantity</td>
				<td style="color: white;">Price</td>
				<td style="color: white;">Date</td>
<!-- 			<td style="color: white;">Customer ID</td>
				<td style="color: white;">FoodID</td>
				
 -->			</tr>
		</thead>
		<tbody>

			<c:forEach items="${CART}" var="c">

				<tr>
					<td><c:out value="${c.foodID}" /></td>
					<td><c:out value="${c.name}" /></td>
					<td><c:out value="${c.foodtype}" /></td>
					<td><c:out value="${c.foodQuantity}" /></td>
					<td><c:out value="${c.price}" /></td>
					<td><c:out value="${c.orderDate}" /></td>
				<td><c:out value="${c.customer_id}"/></td>
					<td><c:out value="${c.foodID}"/></td>
 					<td><a href="<c:url value='/cart-edit-${c.cartID}'/>"><button>Modify</button></a></td>
				<td><a href="<c:url value='/order.html'/>"><button style="color:white ;background:#4CAF50;">Place Order</button></a></td>
				</tr>

			</c:forEach>

		</tbody>
	</table>
 --%>	


	<table border="1">
		<thead>
			<tr>
				<td style="color: white;">Food ID</td>
				<td style="color: white;">Name</td>
				<td style="color: white;">Type</td>
				<td style="color: white;">Size</td>
				<td style="color: white;">Quantity</td>
				<td style="color: white;">Price</td>
				<td style="color: white;">Date</td>
				<td style="color: white;">Total</td>
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
					<td style="color: white;"><%= fb.getFoodQuantity()%></td>
					<td style="color: white;"><%= fb.getPrice()%></td>
					<td style="color: white;"><%= cart.getOrderDate()%></td>
					<td style="color: white;"><%= cart.getTotal()%></td>
				</tr>
			<%
				}
			%>	
		</tbody>
	</table>
	
	<p> Total  <%= cart.getTotal() %>></p>


	<br />
	<br />
	<a href="order.html"><button style="color:white ;background:#4CAF50;">Place Order</button> </a>



</body>
</html>