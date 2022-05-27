package membership;
/*
 DAO(Data Access Object) :실제 데이터베이스에 접근하여 여러가지 CRUD작업을 하기위한 객체.
 */
import common.DBConnPool;

public class MemberDAO extends DBConnPool {
	
	public MemberDAO () {
		super();
	}
	
	/*
	 사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 확인한후
	 존재하ㅡㄴ 정보인 경우 DTO객체에 그 정보를 담아 반환한다.
	 */
	public MemberDTO getMemberDTO (String uid, String upass) {
		
//		//DTO객체 생성
		MemberDTO dto = new MemberDTO();
		//회원로그인을 위한 쿼리문 작성
		String query = "select * from member where id =? and pass=?";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt =con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs= psmt.executeQuery();
			
			//반환된 ResultSet객체를  통해 회원정보가 있는지 확인
			if(rs.next()) {
				//정보가 있다면 DTO객체에 회원정보를 저장한다.
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
				
			}
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
		
	}
	
}
