<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* 
getHeaderNames(): 사용자의 요청 헤더를 얻어올때 사용하는 메서드 
반환 타입은 Enumeration으로 
hasMoreElements(): 출력할 정보가 있는지 확인하여 boolean값을 반환한다.
nextElement():헤더명을 반환한다.

getHeader(): 헤더명을 통해 헤더값을 반환한다.
*/
Enumeration headers = request.getHeaderNames();
while(headers.hasMoreElements()){
	String headerName = (String)headers.nextElement();
	String headerValue = request.getHeader(headerName);
	out.print("헤더명:"+headerName+",헤더값:"+headerValue+"<br>");
}
/*
요청헤더를 통해 확인할 수 잇는 값
user-agent : 사용자가 접속한 웨 브라우저의 종류를 알수있다. 크롬, 파이어폭스 등
referer : 웹을 서핑하면서 링크를 통해 다른 사이트로방분시 남는 흔적을 말한다.
어떤 사이트를 통해 해당 페이지로 유입되었는지 알수있다.
cookie:웹서버가 브라우저를 통해 클라이언트의 컴퓨터에 남기는 흔적으로 
파일형태로 저장된다.
*/
%>
<p>이 파일을 직접실행시 refer 정보는 출력되지 않습니다.</p>
</body>
</html>