<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/css_meta.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../temp/header_nav.jsp"></jsp:include>
	<div class="container">
		<h2>Join Form</h2>
		<form action="./memberJoinProcess.jsp" id="frm" method="post">
			<div class="form-group">
				<label for="id">Id:</label> <input type="text" class="form-control"
					id="id" placeholder="Enter Id" name="id"> <input
					type="hidden" id="idConfirm" value="1"> <input
					type="button" value="중복확인" id="idCheck">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd1" placeholder="Enter password">
			</div>
			<div class="form-group">
				<label for="pw">Password:</label> <input type="password"
					class="form-control" id="pwd2" placeholder="Enter password"
					name="pw">
			</div>
			<div class="form-group">
				<label for="phone">Name:</label> <input type="text"
					class="form-control" id="name" placeholder="Enter Name" name="name">
			</div>
			<div class="form-group">
				<label for="phone">Phone:</label> <input type="tel"
					class="form-control" id="phone" placeholder="Enter Phone"
					name="phone">
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" placeholder="Enter email"
					name="email">
			</div>
			<div class="form-group">
				<label for="email">Age:</label> <input type="number"
					class="form-control" id="age" placeholder="Enter Age" name="age">
			</div>
			<input type="button" class="btn" value="Join" id="btn">
		</form>
	</div>
	<jsp:include page="../temp/footer.jsp"></jsp:include>
	<script type="text/javascript">
		$('#idCheck').click(function() {
			open('memberCheckId.jsp', '_blank', 'width=500, height=300');
		});

		///////////////////////////////////////////////
		/* $('#id').change(function() {
			$('#idConfirm').val('0');
		}); */
		//////////////////////////////////////////////

		$('#pwd2').blur(function() {
			if ($(this).val() == $('#pwd1').val()) {
				alert('같아요');
			} else {
				alert('달라요');
				$(this).val('');
			}
		});

		$('#pwd1').blur(function() {
			$('#pwd2').val('');
		});

		/////////////////////////////////////////////
		$('#btn').click(function() {
			var r = true;
			$(".form-control").each(function() {
				if ($(this).val() == '') {
					r = false;
				}
			});

			if (r && $('#idConfirm').val() == '1') {
				$('#frm').submit();
			} else {
				alert('모두 작성해주세요.');
			}
		});
	</script>
</body>
</html>