package ptithcm.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ptithcm.model.Category;

public class CategoryMapper implements RowMapper<Category> {
	@Override
	public Category mapRow(ResultSet rs, int numRow) throws SQLException {
		Category entity = new Category();
		entity.setId(rs.getInt("CategoryId"));
		entity.setName(rs.getString("CategoryName"));
		entity.setParent(rs.getInt("ParentId"));
		return entity;
	}
}
