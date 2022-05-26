package common;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	public static void main(String[] args) {
		/*
		 JDBC프로그래밍 절차
		 1. 오라클용 JDBC 드라이버를 메모리에 로딩한다.
		 : new를 사용하지 않고 클래스명으로 직접 찾아 객체를 생성한후 메모리애
		 로딩하는 forNAme() 메서드를 사용한다. 메모리에 로딩된 드라이버가
		 DriverManager라는 클래스에 등록된다.
		 2.오라클 연결을 위해 커넥션URL,계정아이디,패스워드를 준비한다.
		 커넥션URL => "jdbc:oracle:thin:@오라클서버의IP주소:포트번호:SID명"
		 *서버환경애따라 ip주소,포트벊호, sid는 변경될수있다.
		 *3.DriverManager 클래스의 정적메서드인 getConnection()을 통해
		 데이터 베이스에 연결을 시도하고, 여녈에 성공시 Connection 객체를 반환한다.
		 4.Connection 객체를 통해 DB작업을 처리하게 된다. 
		 */
		try
			{
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "hr";
			String pass = "1234";
			
			Connection con = DriverManager.getConnection(url,id,pass);
			if(con!=null) {
				System.out.println("Oracle 연결성공");
			}
			else {
				System.out.println("Oracle 연결실패");
			}
			}
		catch(Exception e) {
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}

	}

}
