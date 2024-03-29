<%@page import="com.cruds.pos.bean.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Page</title>
</head>
<body>

	<!-- <p>Thank you,Order Placed Successfully</p> -->

	<c:if test="${param.ERROR != null }">
		<c:out value="${param.ERROR }" />
	</c:if>

	<%
		Cart cart = (Cart) session.getAttribute("CART");
	%>


	<h3>Order Details</h3>

	<table border="1">
		<thead>
			<tr>
				<td>o_id</td>
				<td>orderID</td>
				<td>orderDate</td>
				<td>totalPrice</td>
				<td>orderStatus</td>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${VIEWORDER}" var="o">
				<tr>
					<td><c:out value="${o.o_id}" /></td>
					<td><c:out value="${o.orderID}" /></td>
					<td><c:out value="${o.orderDate}" /></td>   
					<td><c:out value="${o.totalPrice}" /></td>
					<td><c:out value="${o.orderStatus}" /></td>
					<td><a href="<c:url value='/order-del-${o.orderID}'/>">Cancel Order</a></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<a href="home.html">Home </a>

</body>
</html>