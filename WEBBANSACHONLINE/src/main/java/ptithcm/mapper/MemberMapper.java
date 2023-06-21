package ptithcm.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import ptithcm.model.Member;


public class MemberMapper implements RowMapper<Member> {
	@Override
	public Member mapRow(ResultSet rs, int numRow) throws SQLException {
		Member member = new Member();
		member.setId(rs.getInt("MemberId"));
		member.setUsername(rs.getString("Username"));
		member.setPassword(rs.getString("Password"));
		member.setEmail(rs.getString("Email"));
		member.setGender(rs.getInt("Gender"));
		member.setAddeddate(rs.getDate("AddedDate"));
		member.setTel(rs.getString("Tel"));
		return member;
	}
}
