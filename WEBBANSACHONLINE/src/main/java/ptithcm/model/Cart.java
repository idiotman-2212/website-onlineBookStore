package ptithcm.model;

import java.util.Date;

public class Cart {
	private int id;
	private int memberId;
	private int productId;
	private String title;
	private String imageUrl;
	private int price;
	private short quantity;
	private Date addDate;
	
	public Cart() {
		super();
	}

	public Cart(int id, int productId, String title, String imageUrl, int price, short quantity) {
		this.id = id;
		this.productId = productId;
		this.title = title;
		this.imageUrl = imageUrl;
		this.price = price;
		this.quantity = quantity;
	}
	
	public Cart(int id, int memberId, int productId, String title, String imageUrl, int price, short quantity, Date addDate) {
		super();
		this.id = id;
		this.memberId = memberId;
		this.productId = productId;
		this.title = title;
		this.imageUrl = imageUrl;
		this.price = price;
		this.quantity = quantity;
		this.addDate = addDate;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public short getQuantity() {
		return quantity;
	}

	public void setQuantity(short quantity) {
		this.quantity = quantity;
	}
	
	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
}
