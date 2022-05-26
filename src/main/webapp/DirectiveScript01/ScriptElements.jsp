<%@page import="common.MyClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%-- 
	선언부(Declaration): 스크립트나 표현식에서 사용할 메서드를 선언할시	
	사용된다. 선언부에서 선언된 메서드는 해당 JSP가 서블릿(Java파일)으로 변활될때
	멤버메서드 형태로 선언된다.
--%>
<%!
	public int add(int num1, int num2){
	return num1+num2 ;
}
%>
				
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 스크립트렛(Script let): 주로 JSP코드를 작성하고 실행할때 사용한다.
스크립트렛은 body,head 어디서든 사용가능하다 또한 ,<script>,<style>
태크 내부에서도 사용가능하다. 여기에 기술된 코드는 _jspService()메소드 내에 포함된다. 그러므로 해당
영역에서는 메서드를 선언할 수 없다.
	표현식(Expression): 변수를 웹브라우저상에 출력할시 사용한다. JS의 document.write와 동일한 역할을한다.
표현식 사용시 주의할점은 문장끝에 ;(세미콜론)을 붙이지않는것이다. --%>
<%
int result = add(10,20);
%>
덧셈결과 1:<%=result%><br>
덧셈결과 2:<%=add(30,40) %>  	

<h2>내가만든 Java클래스의 메서드 호출하기</h2>
<%
	/* 해당메서드는 static이므로 객체 생성 없이 호출가능하다. */
	int sum = MyClass.myFunc(1, 100);
	out.println("1~100까지의합:"+sum);
	System.out.println("1~100까지의합:"+sum);
%>
</body>
</html>