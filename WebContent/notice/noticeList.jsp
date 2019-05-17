<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDAO noticeDAO = new NoticeDAO();
	int curPage = 1;
	try{
		curPage = Integer.parseInt(request.getParameter("curPage"));
		if(curPage<1){
			curPage=1;
		}
	} catch(Exception e) {
		
	}
	
	String kind = request.getParameter("kind");
	
	if(kind==null){
		kind="title";
	}else if(kind.equals("c")){
		kind="contents";
	}else if(kind.equals("w")){
		kind="writer";
	}else {
		kind="title";
	}
	
	String search = request.getParameter("search");
	if(search== null){
		search="";
	}
	
	int perPage = 10;
	int startRow = (curPage-1)*perPage+1;
	int lastRow = curPage*perPage;
	int totalCount = noticeDAO.getTotalCount(kind, search);
	int totalPage = totalCount/perPage+1;
	if(totalCount%perPage==0){
		totalPage--;
	}
	int perBlock = 5;
	int totalBlock = totalPage/perBlock+1;
	if(totalPage%perBlock==0){
		totalBlock--;
	}
	
	try{
		curPage = Integer.parseInt(request.getParameter("curPage"));
		if(curPage>totalBlock){
			curPage=totalBlock;
		}
	} catch(Exception e) {
		
	}
	
	int curBlock = (curPage/perBlock)+1;
	if(curPage%perBlock==0){
		curBlock--;
	}
	int startNum = (curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	if(curBlock == totalBlock){
		lastNum = totalPage;
	}
	
	ArrayList<NoticeDTO> ar = noticeDAO.selectList(kind, search, startRow, lastRow);
%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

<%@ include file="../temp/css_meta.jsp"%>

<style type="text/css">
.main {
	min-height: 800px;
}
</style>

</head>
<body>
	<%@ include file="../temp/header_nav.jsp"%>

	<div class="container main">
		<div class="row">
			<h1>Notice List</h1>
		</div>
		<!-- table -->
		<div class="row">
			<table class="table table-hover">
				<tr>
					<td>NUM</td>
					<td>TITLE</td>
					<td>WRITER</td>
					<td>DATE</td>
					<td>HIT</td>
				</tr>
				<% for(NoticeDTO noticeDTO: ar){ %>
				<tr>
					<td><%= noticeDTO.getNum() %></td>
					<td class="select" id="<%= noticeDTO.getNum() %>" title="<%= noticeDTO.getNum() %>"><%= noticeDTO.getTitle() %></td>
					<td><%= noticeDTO.getWriter() %></td>
					<td><%= noticeDTO.getReg_date() %></td>
					<td><%= noticeDTO.getHit()%></td>
				</tr>
				<%} %>
			</table>
		</div>
		<div class="row">
  			<form action="./noticeList.jsp">
  			<!-- 제목, 작성자, 내용 -->
				<select name="kind">
					<option value="t">Title</option>
					<option value="w">Writer</option>
					<option value="c">Contents</option>
				</select>
				<input type="text" name="search">
				<button>Search</button>  		
  			</form>
  		</div>
		<div>
			<form id="frm" action="./noticeSelect.jsp" method="post">
				<input type="hidden" id="n" name="num">
			</form>
		</div>
		<div class="row">
			<%if(curBlock > 1) {%>
			<a href="./noticeList.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a>
			<% } %>
			<% for(int i = startNum; i <= lastNum; i++) { %>
			<a href="./noticeList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a>
			<% } %>
			<%if(curBlock < totalBlock) {%>
			<a href="./noticeList.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a>
			<% } %>
			<a href="./noticeWrite.jsp" class="btn btn-primary">Write</a>
		</div>
	</div>

	<%@ include file="../temp/footer.jsp"%>
	<script type="text/javascript">
  
	$('.select').click(function() {
		//var n=$(this).prev().text();
		var n = $(this).attr('title');
		$('#n').val(n);
		$('#frm').submit();
		//alert(n)
		//location.href="./noticeSelect.jsp?num="+n;
	});
  </script>
</body>
</html>