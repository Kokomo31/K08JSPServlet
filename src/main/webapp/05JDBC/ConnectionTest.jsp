<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="common.ConnectDB" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--  <%
ConnectDB jdbc1 = new ConnectDB();
jdbc1.close();
%>--%>

<%-- <%
//JSP에서는 내장객체를 즉시 사용할수 있지만 Java에서는 매개변수를 통해 전달받은후 사용할 수 있다.
DB연결은 매우 빈번히 발생되는 업무로 컨텍스트 초기화 파라미터를 JSP에서 가져오는것보다는 훨씬 효율적이다.
String driver = application.getInitParameter("OracleDriver");
String url = application.getInitParameter("OracleURL");
String id = application.getInitParameter("OracleId");
String pwd = application.getInitParameter("OraclePwd");

ConnectDB jdbc2 = new ConnectDB(driver,url,id,pwd);
jdbc2.close();
%> --%>

<%-- <%
ConnectDB jdbc3 = new ConnectDB(application);
jdbc3.close();
%> --%>
<h2>커넥션 풀 테스트</h2>
<%
DBConnPool pool = new DBConnPool();
pool.close();
%>
</body>
</html>