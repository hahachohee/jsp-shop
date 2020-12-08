<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<h3>상품별 매출 현황</h3>
<table border = "1">
<tr>
	<td>상품명</td>
	<td>총 판매 금액</td>
	<td>판매 개수</td>
</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
		
		
		Statement stmt = conn.createStatement();
		String query = "SELECT " +
						"	    PRODUCT.NAME, " +
						"	    SUM(SALE.SALE_PRICE), SUM(AMOUNT)" +
						"	FROM " +
						"	    PRODUCT   PRODUCT, " +
						"	    SALE      SALE " +
						"	WHERE " +
						"	    PRODUCT.PRODUCT_ID = SALE.PRODUCT_ID " +
						"	GROUP BY  " +
						"	    PRODUCT.PRODUCT_ID, PRODUCT.NAME";

				
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()) {
			
			%>
				<tr>
					<td><%= rs.getString(1)%></td>
					<td><%= rs.getInt(2)%></td>
					<td><%= rs.getInt(3)%></td>
				</tr>
			<%
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>