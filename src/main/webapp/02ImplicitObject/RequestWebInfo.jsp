<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 일기</h2>
	<ul>
	<!-- get혹은 post방식 -->
	<li>데이터전송방식:<%=request.getMethod() %></li>
	<!-- 현재 접속한 전체경로를 반환한다. -->
	<li>URL:<%=request.getRequestURL()%></li>
	<!--  URL에서 호스트(HOST)를 제외한 나머지 경로를 반환한다. -->
	<li>URI:<%=request.getRequestURI() %></li>
	<li>프로토콜:<%=request.getProtocol() %></li>
	<li>서버명:<%=request.getServerName() %></li>
	<li>서버포트:<%=request.getServerPort() %></li>
	<!-- localhost는 루프백 주소이므로 0:0...과 같이 출력된다. -->
	<li>클라이언트ip 주소:<%=request.getRemoteAddr() %></li>
	<li>쿼리스트링:<%=request.getQueryString()%></li>
	<%-- 클라이언트가 get 혹은 post 방식으로 전송한 값을 받을때 사용한다.
		단, 전송방식에 따라 한글이 깨지는 경우가 생긴다. --%>
	<li>전송된값 1:<%=request.getParameter("eng") %></li>
	<li>전송된값 2:<%=request.getParameter("han") %></li>
	</ul>
<body />
</html>