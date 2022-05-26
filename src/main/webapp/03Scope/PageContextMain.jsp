<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@page import="common.Person" %>
<%
pageContext.setAttribute("pageInteger", 1000);
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
pageContext.setAttribute("pagePerson",new Person("한석봉",99));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h2>page 영역의 속성값 읽기</h2>
<!--
	page영역 : 하나의 페이지에서만 영역이 공유되고 페이지 이동, 포워드 된 페이지에서는 영역이 소멸되어 공유되지않는다.
	즉 해당 페이지에서만 사용할수 있는 영역이다. JSP에서의 영역은 데이터(속성)을 저정하는 공간으로 메모리라고 생각하면된다. 

  -->
<%
//정수 데이터를 객체화할때 Integer클래스를 통해 자동 박싱/언박싱 할수있다.
int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
//문자열 데이터는 toString()을 통해 문자열 형태로 반환할수있다.
String pString = pageContext.getAttribute("pageString").toString();
//Perosn과 같이 개발자 정의 클래스는 원래의 타입으로 형변환한다.
Person pPerson = (Person)pageContext.getAttribute("pagePerson");
/*
page 영역을 포함한 4가지 영역에서는 모든 데이터를 저장가능 하다.
Object를 기반으로 저장되므로 차후 값을 읽을때는 해당 타입으로 형변환해야한다.
*/
%>

<ul>
	<!--Java의 기본클래스읜 경우 별도처리없이 즉시 내용을 출력할수있다.  -->
	<li>Integer 객체:<%= pInteger %></li>
	<li>String 객체:<%= pString %></li>
	<!--Person 클래스는 getter()를 통해 출력한다.  -->
	<li>Person 객체:<%= pPerson.getName() %>,<%=pPerson.getAge() %></li>
</ul>
<!--
	지시어를 통한 include는 포함할 페이지의 원본소스를 그대로 현재 문서에 포함시킨후 
	컴파일을 진행한다. 따라서 동일한 페이지로 취급되므로 page영역이 그대로 공유된다.
  -->
<h2>include된 파일에서 page 영역 읽어오기</h2>
<%@ include file="PageInclude.jsp" %>
<!-- 인클루드된 페이지는 정상적으로 내용이 출력된다.  -->
<h2>이동후 page영역의 속성값 읽기</h2>
<!-- pageContextMain.jsp에서 page 영역에 저장된 속성값들은 이동된 현제페이지애서는  -->
<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>