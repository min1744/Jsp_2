<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../temp/css_meta.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>
	<div>
		<form action="./noticeWriteProcess.jsp">
			<div class="form-group">
				<label for="title">SUBJECT:</label> <input type="text" class="form-control" name="title">
			</div>
			<div class="form-group">
				<label for="name">NAME:</label> <input type="text" class="form-control" name="writer">
			</div>
			<div class="form-group">
				<label for="contents">CONTENTS:</label>
				<textarea rows="5" cols="3" class="form-control" name="contents"></textarea>
			</div>
			<div>
				<input type="submit" value="Write">
			</div>
		</form>
	</div>
	<%@include file="../temp/footer.jsp"%>
</body>
</html>