<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="<%= application.getContextPath() %>/index.jsp">Start Bootstrap</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="<%= application.getContextPath() %>/point/point.jsp">Point</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= application.getContextPath() %>/notice/noticeList.jsp">Notice</a>
          </li>
          <% MemberDTO memberDTO = (MemberDTO)session.getAttribute("member"); %>
          <% if(memberDTO != null) { %>
          <li class="nav-item">
            <a class="nav-link" href="<%= application.getContextPath() %>/member/memberMyPage.jsp">MyPage</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= application.getContextPath() %>/member/memberLogout.jsp">Logout</a>
          </li>
          <% } else { %>
          <li class="nav-item">
            <a class="nav-link" href="<%= application.getContextPath() %>/member/memberCheck.jsp">Join</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= application.getContextPath() %>/member/memberLogin.jsp">Login</a>
          </li>
          <% } %>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Blog
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
              <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
              <a class="dropdown-item" href="blog-post.html">Blog Post</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Other Pages
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="full-width.html">Full Width Page</a>
              <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
              <a class="dropdown-item" href="faq.html">FAQ</a>
              <a class="dropdown-item" href="404.html">404</a>
              <a class="dropdown-item" href="pricing.html">Pricing Table</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>