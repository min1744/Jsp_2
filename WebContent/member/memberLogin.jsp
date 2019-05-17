<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/css_meta.jsp" />
</head>
<body>
	<jsp:include page="../temp/header_nav.jsp"></jsp:include>
	<div class="container">
		<h2>LogIn form</h2>
		<form action="./memberLoginProcess.jsp">
			<div class="form-group">
				<label for="id">Id:</label> <input type="text"
					class="form-control" id="id" placeholder="Enter Id"
					name="id">
			</div>
			<div class="form-group">
				<label for="pw">Password:</label> <input type="password"
					class="form-control" id="pw" placeholder="Enter password"
					name="pw">
			</div>
			<div class="checkbox">
				<label><input type="checkbox" name="remember">
					Remember me</label>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
	<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>