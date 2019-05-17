package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iu.utill.DBConnector;

public class MemberDAO {
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		int result = 0;
		Connection con = DBConnector.getConnect();
		//4. SQL문 생성
		String sql = "INSERT INTO POINT VALUES(?,?,?,?,?,?)";
		//5. 미리 전송
		PreparedStatement st = con.prepareStatement(sql);
		
		//6. ? 세팅
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getId());
		st.setInt(4, memberDTO.getPhone());
		st.setString(5, memberDTO.getEmail());
		st.setInt(6, memberDTO.getAge());
		
		//7. 최종 전송 후 처리
		result = st.executeUpdate();
		
		//8. 연결 해제
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		MemberDTO m = null;
		Connection con = DBConnector.getConnect();
		String sql = "SELECT * FROM MEMBER WHERE ID = ? AND PW = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			m = new MemberDTO();
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getInt("phone"));
			m.setEmail(rs.getString("email"));
			m.setAge(rs.getInt("age"));
		}
		DBConnector.disConnect(rs, st, con);
		
		return m;
	}
	
	public int memberUpdate() {
		int result = 0;
		
		return result;
	}
	
	public int memberDelete() {
		int result = 0;
		
		return result;
	}
}