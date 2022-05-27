<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>
<h2>포워드된페이지에서 매개변수 확인</h2>
<ul>
	<!-- request영역을 통해 공유된 person객체와 파라미터로 전달된 값을 화면에 출력한다.
		즉, 자바빈 (객체)은 영역의 공유속성을 이용해서 전달할 수 있다.  -->
	<li><jsp:getProperty property="name" name="person"/></li>
	<li>나이:<jsp:getProperty property="age" name="person"/></li>
	<li>본명:<%=request.getParameter("param1") %></li>
	<li>출생:<%=request.getParameter("param2") %></li>
	<li>툭장:<%=request.getParameter("param3") %></li>
</ul>
<jsp:include page="inc/ParamInclude.jsp">
<jsp:param value="강원도영월" name="loc1"/>
<jsp:param value="김삿갓면" name="loc2"/>
</jsp:include>
</body>
</html>