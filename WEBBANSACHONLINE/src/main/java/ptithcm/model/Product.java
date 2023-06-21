package ptithcm.model;

public class Product {
	private int id;
	private String title;
	private String isbn;
	private int price;
	private String pages;
	private String imageUrl;
	
	public Product() {
		super();
	}
	
	public Product(int id) {
		super();
		this.id = id;
	}

	public Product(int id, String title) {
		super();
		this.id = id;
		this.title = title;
	}
	
	public Product(int id, String title, String isbn) {
		super();
		this.id = id;
		this.title = title;
		this.isbn = isbn;
	}
	
	public Product(int id, String title, String isbn, int price) {
		super();
		this.id = id;
		this.title = title;
		this.isbn = isbn;
		this.price = price;
	}
	
	public Product(int id, String title, String isbn, int price, String pages) {
		super();
		this.id = id;
		this.title = title;
		this.isbn = isbn;
		this.price = price;
		this.pages = pages;
	}
	
	public Product(int id, String title, String isbn, int price, String pages, String imageUrl) {
		super();
		this.id = id;
		this.title = title;
		this.isbn = isbn;
		this.price = price;
		this.pages = pages;
		this.imageUrl = imageUrl;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getPages() {
		return pages;
	}

	public void setPages(String pages) {
		this.pages = pages;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
}
