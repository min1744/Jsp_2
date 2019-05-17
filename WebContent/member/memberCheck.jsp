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
	<jsp:include page="../temp/header_nav.jsp" />
	<div class="container">
		<h2>이용약관</h2>
		<div class="checkbox">
			<label><input type="checkbox" name="remember" id="checkAll">전체동의
			</label>
		</div>

		<div class="checkbox">
			<label><input type="checkbox" name="remember" class="check">동의A</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" name="remember" class="check">동의B</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" name="remember" class="check">동의C</label>
		</div>
		<input type="button" class="btn" id="join" value="Join">
	</div>
	<jsp:include page="../temp/footer.jsp" />
	<script type="text/javascript">
		$('#checkAll').click(function() {
			var c = $(this).prop('checked');
			$('.check').prop('checked', c);
		});
		$('.check').click(function() {
			var c = true;
			$('.check').each(function() {
				if (!$(this).prop('checked')) {
					c = false;
				}
			});
			$('#checkAll').prop('checked', c);
		});
		$('#join').click(function() {
			var c = $('#checkAll').prop('checked');
			if (c) {
				location.href = "./memberJoin.jsp";
			} else {
				alert('약관에 동의');
			}
		});
	</script>
</body>
</html>