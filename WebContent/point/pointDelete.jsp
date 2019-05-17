<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.utill.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	PointDAO pointDAO = new PointDAO();
	int result = pointDAO.delete(num);

	String msg = "DELETE FAIL";
	if(result > 0){
		msg = "DELETE SUCCESS";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=msg %>');
	location.href = "./point.jsp";
</script>
</head>
<body>

</body>
</html>