package ptithcm.dao;

import java.util.List;

import ptithcm.model.Cart;
import ptithcm.mapper.CartMapper;

public class CartDao extends AstractDao {
	public List<Cart> getCarts(int memberId) {
		List<Cart> list = getJdbcTemplate().query("EXEC GetCarts ?", new CartMapper(), memberId);
		return list;
	}

	public int add(Cart cart) {
		return getJdbcTemplate().update("EXEC AddCart  ?, ?, ?", cart.getMemberId(), cart.getProductId(),
				cart.getQuantity());
	}

	public int delete(int cartID) {
		return getJdbcTemplate().update("DELETE FROM CART WHERE CartId = ?", cartID);
	}
}
