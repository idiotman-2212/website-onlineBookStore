package ptithcm.model;

public class Category {
	private Integer id;
	private String name;
	private Integer parent;

	public Category() {
		super();
	}
	
	public Category(Integer id, String name, Integer parent) {
		super();
		this.id = id;
		this.name = name;
		this.parent = parent;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParent() {
		return parent;
	}

	public void setParent(Integer parent) {
		this.parent = parent;
	}
}
