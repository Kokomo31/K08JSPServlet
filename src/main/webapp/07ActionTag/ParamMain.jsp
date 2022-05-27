<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 request.setCharacterEncoding("UTF-8");
 String pValue = "방랑시인";
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자바빈생성: request영역에 저장 -->
	<jsp:useBean id="Person" class="common.Person" scope="request"></jsp:useBean>
	<!--값설정  -->
	<jsp:setProperty name="Person" property="name" value="김삿갓"></jsp:setProperty>
	<jsp:setProperty name="Person" property="age" value="56"></jsp:setProperty>
	<!--다음페이지로 포워드, 3개의 파라미터를 전달  -->
	
	<jsp:forward page="ParamForward.jsp?param1=김병연">
	
	<jsp:param name="param2" value="경기도양주">
	<jsp:param name="param3" value="<%=pValue %>">
	</jsp:forward>
	
</body>
</html>