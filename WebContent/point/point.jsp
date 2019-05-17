<%@page import="com.iu.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.point.PointDAO"%>
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
	PointDAO pointDAO = new PointDAO();
	int curPage=1;
	try{
		curPage=Integer.parseInt(request.getParameter("curPage")) ;
		if(curPage<1){
			//throw new Exception();
			curPage=1;
		}
	}catch(Exception e){
		
	}
	
	String kind = request.getParameter("kind");
	
	if(kind==null){
		kind="name";
	}else if(kind.equals("c")){
		kind="contents";
	}else if(kind.equals("w")){
		kind="writer";
	}else {
		kind="name";
	}
	
	
	String search = request.getParameter("search");
	if(search== null){
		search="";
	}
	
	
	int perPage=10;
	int startRow=(curPage-1)*perPage+1;
	int lastRow = curPage*perPage;//10
	
	//1. 총글의 갯수
	int totalCount=pointDAO.getTotalCount(kind, search);
	//2. 총페이지의 갯수
	int totalPage=totalCount/perPage;
	if(totalCount%perPage !=0 ){
		totalPage++;
	}
	
	//3. block 당 숫자의 갯수
	int perBlock=5;
	
	//4. 총 block의 갯수
	int totalBlock=totalPage/perBlock;
	if(totalPage%perBlock !=0){
		totalBlock++;
	}
	
	//5. curPage를 이용해서 현재 block번호 찾기
	int curBlock = curPage/perBlock;
	if(curPage%perBlock !=0 ){
		curBlock++;
	}
	
	//6. curBlock에서 startNum과 lastNum 찾기
	int startNum = (curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	
	if(curBlock==totalBlock){
		lastNum=totalPage;
	}
	
	
	ArrayList<PointDTO> ar = pointDAO.selectList(kind, search,startRow, lastRow);
			
%>    
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
 
 <%@ include file="../temp/css_meta.jsp" %>

  <style type="text/css">
  	.main {
  		min-height: 800px;
  	}
  
  </style>	

</head>
<body>
  <%@ include file="../temp/header_nav.jsp" %>	
  
  <div class="container main">
  	<div class="row">
  		<h1>Point Page</h1>
  	</div>
  	<!-- table -->
  	<div class="row">
		<table class="table table-hover">
			<tr>
				<td>NUM</td><td>NAME</td><td>KOR</td><td>ENG</td><td>MATH</td><td>TOTAL</td><td>AVG</td>
			</tr>
		<% for(PointDTO pointDTO: ar) { %>
			<tr>
				<td><%= pointDTO.getNum() %> </td>
				<td><a href="./pointSelect.jsp?num=<%= pointDTO.getNum() %>"><%= pointDTO.getName() %></a></td>
				<td><%= pointDTO.getKor() %> </td>
				<td><%= pointDTO.getEng() %> </td>
				<td><%= pointDTO.getMath() %> </td>
				<td><%= pointDTO.getSum() %> </td>
				<td><%= pointDTO.getAvg() %> </td>
			</tr>
		<% } %>
		</table>  	
  	</div>
  	<div class="row">
  		<form action="./point.jsp">
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
  	<div class="row">
  		<% if(curBlock>1){ %>
  			<a href="./point.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a>
  		<%} %>
  	
  		<% for(int i=startNum;i<=lastNum;i++){ %>
  			<a href="./point.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a>
  		<%} %>
  		<% if(curBlock<totalBlock){ %>		
  			<a href="./point.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a>
  		<%} %>	
  	</div>
  	
  	
  	<div class="row">
  		<a href="./pointWrite.jsp" class="btn btn-primary">Write</a>
  	</div>
  </div>
  



 <%@ include file="../temp/footer.jsp" %>
</body>
</html>