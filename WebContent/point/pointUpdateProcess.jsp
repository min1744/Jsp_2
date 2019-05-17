<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.utill.DBConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PointDTO pointDTO = new PointDTO();
	PointDAO pointDAO = new PointDAO();
	pointDTO.setNum(Integer.parseInt(request.getParameter("num")));
	pointDTO.setName(request.getParameter("name"));
	pointDTO.setKor(Integer.parseInt(request.getParameter("kor")));
	pointDTO.setEng(Integer.parseInt(request.getParameter("eng")));
	pointDTO.setMath(Integer.parseInt(request.getParameter("math")));
	pointDTO.setSum(pointDTO.getKor() + pointDTO.getEng() +pointDTO.getMath());
	pointDTO.setAvg(pointDTO.getSum() / 3.0);
	int result = pointDAO.update(pointDTO);
	
	if(result > 0){
		String msg = "UPDATE SUCCESS";
		request.setAttribute("message", msg);
		request.setAttribute("path", "./point.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");//이동해야 할  경로
		view.forward(request, response);
	}else{
		response.sendRedirect("./pointUpdate.jsp?num="+pointDTO.getNum());
	}
	
	//수정이 성공하면 성공 메시지를 alert로 하고 point.jsp로 이동
	//수정이 실패하면 실패하면 pointUpdate.jsp로 redirect를 활용하여 이동
%>