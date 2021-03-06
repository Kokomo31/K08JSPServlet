package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class BoardDAO extends DBConnPool {
	
		public BoardDAO() {
			super();
		}
		/*
		 board테이블에 저장된 게시물의 갯수를 카운트하기 위한 메서드
		 카운트 한 결과값을 통해 목록 출력시 게시물의 순번을 출력한다.
		 만약 검색어가 있는 경우를 대비하여 Map컬렉션을 매개변수로 선언한다.
		 */
		public int selectCount(Map <String,Object> map) {
			//카운트 변수
			int totalCount = 0;
			//쿼리문 작성
			String query = "SELECT COUNT(*) FROM board";
			//검색어가 있는 경우 where절을 조건부로 추가한다.
			if(map.get("searchWord")!= null) {
				/*
				 만약 제목에 '노트북'이라고 검색했다면...
				 => where title like '%노트눅%'
				 과 같이 쿼리문이 추가될것이다.
				 */
				query += " WHERE "+map.get("searchField")+" LIKE '%"+map.get("searchWord")+"%'";
			}
			try {
				//?가 없는 정적쿼리문이므로 Statement 객체를 통해 실행한다.
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				//count(*)를 통한 쿼리문은 항상 0혹은 정수의 결과가 있으므로 if문이 필요없다.
				//next()메서드를 통해 결과를 한행 읽어온다.
				rs.next();
				//결과값을 변수에 저장한다.
				totalCount = rs.getInt(1);
			}
			catch (Exception e) {
				System.out.println("게시물 수를 구하는중 예외 발생");
				e.printStackTrace();
			}
			//결과값 반환한다.
			return totalCount;
			
		}
		/*
		 목록에 출력할 게시물을 오라클로부터 추출하기 위한 쿼리문을 실행한다.
		 */
		
		public List<BoardDTO> selectList(Map<String,Object> map){
			List<BoardDTO> bbs = new Vector<BoardDTO>();
			/*
			 select한 게시물의 목록은 다수의 래코드가 포함되므로 이를 저장하기 위해 순서를 보장하는 List계열의 컬렉션이 필요하다.
			 Set 컬렉션은 순서를 보장하지 못하므로 게시판 목록을 출력하는 용도로는 사용할 수 없다. 
			 */
			
			/*
			 목록에 출력할 게시물을 추출하기 위한 쿼리문으로 항상 일련번호(작성순)의 역순(내림차순)으로 정렬해야 한다. 게시판의 목록은 최근 게시물이
			 제일 위쪽에 노출되기 때문이다.
			 */
			String query = "SELECT * FROM board";
			if(map.get("searchWord")!= null) {
				query += " WHERE "+map.get("searchField")+" "+" LIKE '%"+map.get("searchWord")+"%'";
			}
			query += " ORDER BY num DESC";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				
				//추출된 결과에 따라 갯수만큼 반복한다.
				while(rs.next()) {
					//하나의 레코드를 읽어서 추출한후 DTO객체에 저장한다.
					//DTO객체를 생성한 후
					BoardDTO dto = new BoardDTO();
					//각 멤버변수에 해당하는 컬럼을 매칭하여 데이터를 저장한다.
					dto.setNum(rs.getString("num"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setPostdate (rs.getDate("postdate"));
					dto.setId(rs.getString("id"));
					dto.setVisitcount(rs.getString("visitcount"));
					
					//하나의 레코드를 DTO에 저장한 후 List컬렉션에 추가한다.
					bbs.add(dto);
				}
			}
			catch (Exception e) {
				System.out.println("게시물 조회중 예외 발생");
				e.printStackTrace();
			}
			//List.jsp로 컬렉션을 반환			
			return bbs;
		}
		
	
	
}
