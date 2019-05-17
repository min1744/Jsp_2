<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.utill.DBConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int sum = kor + eng + math;
	double avg = sum / 3.0;
	PointDAO pointDAO = new PointDAO();
	PointDTO pointDTO = new PointDTO();
	pointDTO.setName(name);
	pointDTO.setKor(kor);
	pointDTO.setEng(eng);
	pointDTO.setMath(math);
	pointDTO.setSum(sum);
	pointDTO.setAvg(avg);
	int result = pointDAO.insert(pointDTO);
	
	String msg = "INSERT FAIL";
	if(result > 0){
		msg = "INSERT SUCCESS";
	}
	
	request.setAttribute("message", msg);
	//key : path
	request.setAttribute("path", "./point.jsp");
	
	//common/result.jsp
	//forward
	RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");//이동해야 할  경로
	view.forward(request, response);
	
	//redirect
	//response.sendRedirect("../common/test/result.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=msg %>');
	location.href = "./point.jsp";
</script>
</head>
<body>
	
</body>
</html>