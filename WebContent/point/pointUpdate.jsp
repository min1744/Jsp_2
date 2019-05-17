<%@page import="com.iu.utill.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection con = DBConnector.getConnect();
	int num = Integer.parseInt(request.getParameter("num"));
	
	String sql = "SELECT * FROM POINT WHERE NUM = ?";
	PreparedStatement st = con.prepareStatement(sql);
	st.setInt(1, num);
	ResultSet rs = st.executeQuery();

	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../temp/css_meta.jsp"%>
<style type="text/css">
.info {
	text-align: center;
	margin: 300px;
}
</style>
</head>
<body>
	<%@ include file="../temp/header_nav.jsp"%>
	<div class="container">
		<div class="row">
			<form class="info" action="./pointUpdateProcess.jsp">
				Name : <input type="text" name="name" placeholder="name" value="<%=rs.getString("name")%>"><br>
				Kor : <input type="number" name="kor" placeholder="kor" value="<%=rs.getString("kor")%>"><br>
				Eng : <input type="number" name="eng" placeholder="eng" value="<%=rs.getString("eng")%>"><br>
				Math : <input type="number" name="math" placeholder="math" value="<%=rs.getString("math")%>"><br>
				<input type="hidden" name="num" value="<%=rs.getString("num")%>">
				<input type="submit" value="Update">
			</form>
		</div>
	</div>
	<%@ include file="../temp/footer.jsp"%>
	<%
		DBConnector.disConnect(rs, st, con);
	%>
</body>
</html>