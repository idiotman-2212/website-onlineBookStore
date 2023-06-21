package ptithcm.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ptithcm.model.Author;

public class AuthorMapper implements RowMapper<Author> {
	@Override
	public Author mapRow(ResultSet rs, int numRow) throws SQLException {
		Author author = new Author();
		author.setId(rs.getInt("AuthorId"));
		author.setName(rs.getString("AuthorName"));
		return author;
	}
}
