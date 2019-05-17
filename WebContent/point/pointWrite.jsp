<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@ include file="../temp/css_meta.jsp" %>
<style type="text/css">
	.info{
		text-align: center;
		margin: 300px;
	}
</style>
</head>
<body>
	<%@ include file="../temp/header_nav.jsp" %>
	<div class="container">
		<div class="row">
			<form class="info" action="./pointWriteProcess.jsp" method="post">
				Name : <input type="text" name="name" placeholder="name"><br>
				Kor : <input type="number" name="kor" placeholder="kor"><br>
				Eng : <input type="number" name="eng" placeholder="eng"><br>
				Math : <input type="number" name="math" placeholder="math"><br>
				<br> <input type="submit" value="Write">
			</form>
		</div>
	</div>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>