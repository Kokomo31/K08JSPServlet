package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public  class ConnectDB {
		
		//상속관계에서 접근이 가능한 protected 접근지정자로 멤버변수 선언
		protected Connection con;//db연결을 위한 객체
		protected Statement stmt;//정적쿼리문을 전송 및 실행하기 위ㅏㅎㄴ 객체
		protected ResultSet rs;
		//생성자1 : 계정 아이디, 패스워드를 매개변수로 받음
		 public ConnectDB(String id,String pw) {
			try {
				//드라이버 로드 및 오라클 DB연결
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",id,pw);
			
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
		
	//생성자 2:고정된 값으로 DB연결
   public ConnectDB() {
	try {
		//드라이버 로드 및 오라클 DB연결
	Class.forName("oracle.jdbc.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Musthave","1234");
	
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
   public ConnectDB(String driver, String url, String id, String pwd) {
	   try {
		   Class.forName(driver);
		   con = DriverManager.getConnection(url,id,pwd);
		   System.out.println("DB 연결 성공(인수 생성자 1)");
	   }
	   catch (Exception e) {
		e.printStackTrace();
	}
   }
   
   public ConnectDB(ServletContext application) {
	   try {
		   String driver = application.getInitParameter("OracleDriver");
		   Class.forName(driver);
		   String url = application.getInitParameter("OracleURL");
		   String id = application.getInitParameter("OracleId");
		   String pwd = application.getInitParameter("OraclePwd");
		   con = DriverManager.getConnection(url,id,pwd);
		   System.out.println("DB연결 성공적 (생성자2)");
	   }
	   catch (Exception e) {
		e.printStackTrace();
	}
   }
	public void close() {
		try {
			//연결 확인 후 자원해제
			if(stmt!=null) stmt.close();
			if(con!=null)con.close();
			System.out.println("DB자원반납완료");
		}
		catch(SQLException e) {
			System.out.println("자원반납시 오류가 발생하였습니다");
		}
	}
	public void execute() {
	}
	/*
	 상속 관계에서 오버라이딩을 목적으ㅗ 생성한 추상메서드
	 */
   }
