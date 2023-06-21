package ptithcm.model;

public class Role {
	private Integer id;
	private String  name;
	
	public Role() {
	
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
	
	public Role(Integer id, String name) {
		this.id = id;
		this.name = name;
	}
}
