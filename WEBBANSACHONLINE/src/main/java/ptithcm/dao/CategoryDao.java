package ptithcm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import ptithcm.model.Category;
import ptithcm.mapper.CategoryMapper;

public class CategoryDao extends AstractDao {
	public List<Category> getAllCategory() {
		List<Category> list = getJdbcTemplate().query("SELECT * FROM Category", new CategoryMapper());
		return list;
	}
	
	public Category getCategory(int id) {
		return getJdbcTemplate().queryForObject("SELECT * FROM Category WHERE CategoryId = ?",
				new RowMapper<Category>() {
					@Override
					public Category mapRow(ResultSet rs, int rowNumber) throws SQLException {
						return new Category(rs.getInt("CategoryId"), rs.getString("CategoryName"),
								rs.getInt("ParentId"));
					}
				}, id);
	}
	public int add(Category category) {
		return getJdbcTemplate().update("INSERT INTO Category( CategoryName, ParentId) VALUES(?, ?)",
				category.getName(), category.getParent());
	}
	
	public int edit(Category category) {
		return getJdbcTemplate().update("UPDATE Category SET CategoryName = ? , ParentId = ?  WHERE CategoryId = ?",
				category.getName(), category.getParent(), category.getId());
	}

	public int delete(int id) {
		return getJdbcTemplate().update("DELETE FROM Category WHERE CategoryId = ?", id);
	}
	
	public int delete(List<Integer> list) {
		for (Integer id : list) {
			return getJdbcTemplate().update("DELETE FROM Category WHERE CategoryId = ?", id);
		}
		return 1;
	}
}
