package ptithcm.dao;

import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ptithcm.helper.Helper;
import ptithcm.model.Member;
import ptithcm.model.Role;
import ptithcm.mapper.MemberMapper;

public class MemberDao extends AstractDao {
	public List<Member> getAllMember() {
		List<Integer> arrMemberID = getAllRole();
		List<Member> members = new ArrayList<Member>();
		for (int i = 0; i < arrMemberID.size(); i++) {
			List<Member> list = getJdbcTemplate().query("SELECT * FROM Member where MemberId = ?", new MemberMapper(), arrMemberID.get(i));
			members.add(list.get(0));
		}
		return members;
	}
	
	public int delete(int id) {
		return getJdbcTemplate()
				.update("DELETE FROM MemberInRole WHERE MemberId = ? "
					  + "DELETE FROM Member WHERE MemberId = ?", id, id);
	}
	
	public int delete(List<Integer> list) {
		for (Integer id : list) {
			return getJdbcTemplate()
					.update("DELETE FROM MemberInRole WHERE MemberId = ?"
					  	  + "DELETE FROM Member WHERE MemberId = ?", id);
		}
		return 1;
	}
	
	public Member getMember(int id) {
		return getJdbcTemplate().queryForObject("SELECT * FROM Member WHERE MemberId = ?", new MemberMapper(), id);

	}

	public int edit(Member member) {
		String pass = Helper.bCrypt(member.getPassword());
		return getJdbcTemplate().update(
				"UPDATE Member SET Username = ?, Password =?, Email=?, Gender=?, Tel=? WHERE MemberId = ?",
				member.getUsername(), pass, member.getEmail(), member.getGender(), member.getTel(), member.getId());
	}

	public int add(Member member) {
		String pass = Helper.bCrypt(member.getPassword());
		int a = getJdbcTemplate().update(
				"INSERT INTO dbo.Member( Username ,Password ,Email ,Gender , Tel) VALUES(?, ?, ?, ?, ?)",
				member.getUsername(), pass, member.getEmail(), member.getGender(), member.getTel());
		if (a > 0) {
			int id = getMemberIDMail(member.getEmail());
			if (id != -1) {
				int b = getJdbcTemplate().update("INSERT INTO MemberInRole(MemberId, RoleId) VALUES(?, ?)", id, 2);
				return a + b;
			}
		}
		return a;
	}
	
	public int addEmployee(Member member) {
		String pass = Helper.bCrypt(member.getPassword());
		int a = getJdbcTemplate().update(
				"INSERT INTO dbo.Member( Username ,Password ,Email ,Gender , Tel) VALUES(?,?,?,?,?)",
				member.getUsername(), pass, member.getEmail(), member.getGender(), member.getTel());

		System.out.println("so a: " + a);
		if (a > 0) {
			int id = getMemberIDMail(member.getEmail());
			System.out.println("id user: " + id);
			if (id != -1) {
				int b = getJdbcTemplate().update("INSERT INTO MemberInRole(MemberId, RoleId) VALUES(?, ?)", id, 3);
				return a + b;
			}
		}
		return a;
	}
	
	public int updatePassword(String newPass, String email) {
		String passbCrypt = Helper.bCrypt(newPass);
		int a = getJdbcTemplate().update("UPDATE dbo.Member SET Password =? WHERE Email = ?", passbCrypt, email);
		return a;
	}

	public int getMemberIDByEmail(String email) {
		List<Member> listMember = getJdbcTemplate().query("SELECT * FROM dbo.Member WHERE Email = ?",
				new MemberMapper(), email);
		if (listMember.size() > 0) {
			return listMember.size();
		}
		return -1;
	}

	public int getMemberIDMail(String email) {
		List<Member> listMember = getJdbcTemplate().query("SELECT * FROM dbo.Member WHERE Email = ?",
				new MemberMapper(), email);
		if (listMember.size() > 0) {
			return listMember.get(0).getId();
		}
		return -1;
	}

	public int getMemberIDByPhone(String phone) {
		List<Member> listMember = getJdbcTemplate().query("SELECT * FROM dbo.Member WHERE Tel = ?", new MemberMapper(),
				phone);
		if (listMember.size() > 0) {
			return listMember.size();
		}
		return -1;
	}
	
	public Member login(String password, String email) {
		List<Member> listMember = getJdbcTemplate().query("SELECT * FROM dbo.Member WHERE (Email =? OR Tel =?)",
				new MemberMapper(), email, email);
		if (listMember.size() > 0) {
			if (Helper.encryptionBCrypt(password, listMember.get(0).getPassword()) == true)
				return listMember.get(0);
			// sai mat khau
			else
				return null;
		}
		return null;
	}

	public Role getRoleLogin(int id) {
		List<Role> role = getJdbcTemplate().query(
				"SELECT * FROM dbo.Role WHERE RoleId = (SELECT RoleId FROM dbo.MemberInRole WHERE MemberId = ?)",
				new RowMapper<Role>() {

					@Override
					public Role mapRow(ResultSet rs, int rowNum) throws SQLException {
						return new Role(rs.getInt("RoleId"), rs.getString("RoleName"));
					}

				}, id);
		if (role.size() > 0) {
			return role.get(0);
		}
		return null;
	}
	
	public List<Integer> getAllRole() {
		List<Integer> arrMemberID = getJdbcTemplate().query("SELECT MemberId FROM dbo.MemberInRole WHERE RoleId = 3",
				new RowMapper<Integer>() {

					@Override
					public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
						return rs.getInt("MemberId");
					}

				});
		return arrMemberID;
	}
}
