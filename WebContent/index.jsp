<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/css.css"></link>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
</head>
<body>
	<%@include file ="static/header.jsp" %>
	<%@include file ="static/nav.jsp" %>
	
	<%
		switch(section) {
		case "registration_of_sale":
			%><%@include file = "page/registration_of_sale.jsp" %><%
			break;
		case "sales_by_product":
			%><%@include file = "page/sales_by_product.jsp"%><%
			break;
		case "Sales_History":
			%><%@include file = "page/Sales_History.jsp"%><%
			break;
		case "status_check":
			%><%@include file = "page/status_check.jsp"%><%
			break;
		default :
			%><%@include file = "static/index.jsp"%><%
		}
	%>
	
	<%@include file ="static/footer.jsp" %>
</body>
</html>