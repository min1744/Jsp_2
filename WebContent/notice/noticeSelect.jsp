<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = noticeDAO.selectOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp"%>
<style type="text/css">
	.center{
		text-align: center;
	}
</style>
</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>
	<div class="row">
	<h1>NOTICE</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="center" colspan="2">SUBJECT</th>
					<th class="center">NAME</th>
					<th class="center">DATE</th>
					<th class="center">HIT</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2"><%= noticeDTO.getTitle() %></td>
					<td class="center"><%= noticeDTO.getWriter() %></td>
					<td class="center"><%= noticeDTO.getReg_date() %></td>
					<td class="center"><%= noticeDTO.getHit() %></td>
				</tr>
				<tr>
					<td colspan="5"><%= noticeDTO.getContents() %></td>
				</tr>
				<tr>
					<td class="center">NEXT</td>
					<td><%= noticeDTO.getTitle() %></td>
					<td class="center"><%= noticeDTO.getWriter() %></td>
					<td class="center"><%= noticeDTO.getReg_date() %></td>
					<td class="center"><%= noticeDTO.getHit() %></td>
				</tr>
				<tr>
					<td class="center">PREV</td>
					<td><%= noticeDTO.getTitle() %></td>
					<td class="center"><%= noticeDTO.getWriter() %></td>
					<td class="center"><%= noticeDTO.getReg_date() %></td>
					<td class="center"><%= noticeDTO.getHit() %></td>
				</tr>
			</tbody>
		</table>
		<div>
			<a href="./noticeUpdate.jsp?num=<%=noticeDTO.getNum() %>">Update</a>
			<a href="./noticeDelete.jsp?num=<%=noticeDTO.getNum() %>">Delete</a>
		</div>
	</div>
	<%@include file="../temp/footer.jsp"%>
</body>
</html>