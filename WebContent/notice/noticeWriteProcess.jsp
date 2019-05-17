<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setContents(request.getParameter("contents"));
	noticeDTO.setWriter(request.getParameter("writer"));
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.insert(noticeDTO);
	
	String msg = "INSERT FAIL";
	if(result > 0){
		msg = "INSERT SUCCESS";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=msg %>');
	location.href = "./noticeList.jsp";
</script>
</head>
<body>

</body>
</html>