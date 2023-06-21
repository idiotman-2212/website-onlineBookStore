package ptithcm.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ptithcm.model.Cart;

public class CartMapper implements RowMapper<Cart> {
	@Override
	public Cart mapRow(ResultSet rs, int numRow) throws SQLException {
		Cart cart = new Cart();
		cart.setId(rs.getInt("CartId"));
		cart.setProductId(rs.getInt("ProductId"));
		cart.setTitle(rs.getString("Title"));
		cart.setImageUrl(rs.getString("ImageUrl"));
		cart.setQuantity(rs.getShort("Quantity"));
		cart.setPrice(rs.getInt("Price"));
		cart.setAddDate(rs.getDate("AddedDate"));
		return cart;
	}
}
