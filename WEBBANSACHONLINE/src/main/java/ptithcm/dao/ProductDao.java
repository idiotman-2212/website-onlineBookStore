package ptithcm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import ptithcm.model.Product;

import ptithcm.mapper.ProductMapper;


public class ProductDao extends AstractDao {
	public int count() {
		return getJdbcTemplate().queryForObject("SELECT COUNT(*) AS Total FROM Product", new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int rowNumber) throws SQLException {
				return rs.getInt("Total");
			}
		});
	}
	
	public int delete(int id) {
		return getJdbcTemplate().update("DELETE FROM Product WHERE ProductId = ?", id);
	}
	
	/*
	 * public List<Product> getProducts() { List<Product> list =
	 * getJdbcTemplate().query("SELECT * FROM Product", new ProductMapper());
	 * return list; }
	 */
	
	public List<Product> getProducts(Integer index, Integer size) {
		return getJdbcTemplate().query(
				"select * from Product order by productid asc offset ? row fetch next ? row only",
				new RowMapper<Product>() {
					@Override
					public Product mapRow(ResultSet rs, int numRow) throws SQLException {
						return new Product(rs.getInt("ProductId"), rs.getString("Title"), rs.getString("ISBN"),
								rs.getInt("Price"), rs.getString("Pages"), rs.getString("ImageUrl"));
					}
				}, (index - 1) * size, size);
	}
	
	// get all list product
	public List<Product> getAllProducts() {
		return getJdbcTemplate().query("select * from Product ", new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int numRow) throws SQLException {
				return new Product(rs.getInt("ProductId"), rs.getString("Title"), rs.getString("ISBN"),
						rs.getInt("Price"), rs.getString("Pages"), rs.getString("ImageUrl"));
			}
		});
	}

	public Product getProduct(int id) {
		return getJdbcTemplate().queryForObject("SELECT * FROM Product WHERE ProductId = ?", new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int arg1) throws SQLException {
				return new Product(rs.getInt("ProductId"), rs.getString("Title"), rs.getString("ISBN"),
						rs.getInt("Price"), rs.getString("Pages"), rs.getString("ImageUrl"));
			}
		}, id);
	}	
	
	public List<Product> search(String q) {
		return getJdbcTemplate().query("SELECT * FROM Product WHERE Title LIKE ?", new ProductMapper(), "%" + q + "%");
	}

	public Integer insert(Product product) {
		return getJdbcTemplate().update("insert into Product(Title,ISBN,Price,Pages, ImageUrl) values(?,?,?,?,?)",
				product.getTitle(), product.getIsbn(), product.getPrice(), product.getPages(), product.getImageUrl());
	}

	public int edit(Product product, int id) {
		return getJdbcTemplate().update(
				"UPDATE Product SET Title = ?, ISBN =?, Price=?,Pages=?, ImageUrl=? WHERE ProductId = ?", product.getTitle(),
				product.getIsbn(), product.getPrice(), product.getPages(), product.getImageUrl(), id);
	}

	public List<Product> getProductsByCategoryID(int id) {
		return getJdbcTemplate().query(
				"SELECT * FROM dbo.Product WHERE CategoryId = ?",
				new RowMapper<Product>() {
					@Override
					public Product mapRow(ResultSet rs, int numRow) throws SQLException {
						return new Product(rs.getInt("ProductId"), rs.getString("Title"), rs.getString("ISBN"),
								rs.getInt("Price"), rs.getString("Pages"), rs.getString("ImageUrl"));
					}
				}, id);
	}
	
	// public int updateImg(Product product) {
		// return getJdbcTemplate().update("UPDATE Product SET ImageUrl = ? WHERE
		// ProductId = ?", product.getImageUrl(),
		// product.getId());
		// }
}
