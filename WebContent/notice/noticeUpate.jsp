<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.iu.utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
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
<%@include file="../temp/css_meta.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>
	<div>
		<form action="./noticeUpdateProcess.jsp">
			<div class="form-group">
				<label for="title">SUBJECT:</label> <input type="text" class="form-control" name="title" value="<%=rs.getString("title")%>">
			</div>
			<div class="form-group">
				<label for="name">NAME:</label> <input type="text" class="form-control" name="writer" value="<%=rs.getString("writer")%>">
			</div>
			<div class="form-group">
				<label for="contents">CONTENTS:</label>
				<textarea rows="5" cols="3" class="form-control" name="contents"><%=rs.getString("contents")%></textarea>
			</div>
			<div>
				<input type="submit" value="Write">
			</div>
		</form>
	</div>
	<%@include file="../temp/footer.jsp"%>
</body>
</html>