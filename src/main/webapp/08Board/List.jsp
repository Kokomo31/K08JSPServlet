<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
BoardDAO dao = new BoardDAO();

Map<String,Object> param = new HashMap<String,Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	//검색을 위한 테이블의 컬럼명 : title,content
	param.put("searchField",searchField);
	//클라이언트가 입력한 검색어
	param.put("searchWord",searchWord);
	
}
//board테이블에 저장된 게시물의 갯수를 카운트 한다.
int totalCount = dao.selectCount(param);
//목록에 출력할 레코드를 추출한다.
List<BoardDTO> boardLists = dao.selectList(param);
//만약 검색어가 있다면 해당조건에 맞는 게시물만 select해야한다.
//따라서 검색어 여부에 따라 where절이 조건부로 추가된다.
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../Common/Link.jsp" />  

    <h2>목록 보기(List)</h2>
    <!--form태그에 action속성이 없으면 폼값은 현재 페이지로 전송된다.  -->
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
<%
//List컬렉션에 저장된 내용이 없을때 true를 반환하는 isEmpty()메서드를 사용해서
//출력할 게시물이 있는지 확인한다.
if (boardLists.isEmpty()) {
	//게시물이 하나도 없을시
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
	//게시물이 있는경우라면...
	//게시물의 출력번호
    int virtualNum = 0; 
	//게시물의 갯수만큼, 즉 List컬렉션에 저장된 저장된 DTO객체의 개수수만큼 반복한다.
    for (BoardDTO dto : boardLists)
    {
    	//전체레코드 수를 1씩 차감하면서 리스트에 출력한다.
        virtualNum = totalCount--;   
%>
        <tr align="center">
            <td><%= virtualNum %></td>  
            <td align="left"> 
                <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
            </td>
            <td align="center"><%= dto.getId() %></td>           
            <td align="center"><%= dto.getVisitcount() %></td>   
            <td align="center"><%= dto.getPostdate() %></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
</body>


</html>