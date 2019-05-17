<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<NoticeDTO> ar = noticeDAO.selectList();
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
.center {
	text-align: center;
}
</style>
<%@include file="../temp/css_meta.jsp"%>
</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>
	<div class="container">
		<form action="./noticeWrite.jsp">
			<div class="row">
				<h1>NOTICE</h1>
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="center">NO</th>
							<th class="center">SUBJECT</th>
							<th class="center">NAME</th>
							<th class="center">DATE</th>
							<th class="center">HIT</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (NoticeDTO noticeDTO : ar) {
						%>
						<tr>
							<td class="center"><%=noticeDTO.getNum()%></td>
							<td><a href="./noticeSelect.jsp?num=<%=noticeDTO.getNum()%>"><%=noticeDTO.getTitle()%></a></td>
							<td class="center"><a href="#"><%=noticeDTO.getWriter()%></a></td>
							<td class="center"><%=noticeDTO.getReg_date()%></td>
							<td class="center"><%=noticeDTO.getHit()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<div class="row">
				<input type="submit" value="Write">
			</div>
		</form>
	</div>
	<%@include file="../temp/footer.jsp"%>
</body>
</html>