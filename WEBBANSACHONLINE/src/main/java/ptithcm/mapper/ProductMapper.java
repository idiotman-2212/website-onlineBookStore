package ptithcm.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ptithcm.model.Product;

public class ProductMapper implements RowMapper<Product> {
	@Override
	public Product mapRow(ResultSet rs, int numRow) throws SQLException {
		Product entity = new Product();
		entity.setId(rs.getInt("ProductId"));
		entity.setImageUrl(rs.getString("ImageUrl"));
		entity.setIsbn(rs.getString("ISBN"));
		entity.setPages(rs.getString("Pages"));
		entity.setPrice(rs.getInt("Price"));
		entity.setTitle(rs.getString("Title"));
		return entity;
	}
}
