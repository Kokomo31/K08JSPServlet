<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="utils.CookieManager" %>
     <%@page import="utils.JSFunction" %>
<%
//전송된 폼값을 받는다.
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
/*
체크박스의 경우 둘 이상의 값이라면 getParameterValues()를 통해 받아야 하지만
항목이 한개라면 getParameter()을 사용가능하다.
*/
String save_check = request.getParameter("save_check");

//아이디,패스워드 일치여부를 확인
if("must".equals(user_id)&& "1234".equals(user_pw)){
	//아이디저장하기 체크박스를 체크한 경우
	if(save_check != null && save_check.equals("Y")){
		//쿠키를 생선한다. 쿠키값은 로그인 아이디, 유효기간은 1일로 설정한다.
		CookieManager.makeCookie(response, "loginId", user_id, 86400);
	}
	else{
		//체크를 해제한 경우에는 쿠키를 삭제한다.
		CookieManager.deleteCookie(response, "loginId");
	}
	JSFunction.alertLocation("로그인에성공", "IdSaveMain.jsp", out);
}
else{
	JSFunction.alertBack("로그인실패", out);
}
%>
