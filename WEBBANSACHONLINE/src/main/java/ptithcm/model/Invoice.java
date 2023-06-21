package ptithcm.model;

import java.util.Date;

public class Invoice {
	private int id;
	private int memberId;
	private String tel;
	private String address;
	private String email;
	private Date date;
	private Integer statusId;
	private String status;
	
	public Invoice() {
	
	}

	public Invoice(String tel, String address, String email) {
		super();
		this.tel = tel;
		this.address = address;
		this.email = email;
	}
	
	public Invoice(int id, int memberId, String tel, String address, String email, Integer statusId, String status,
			Date date) {
		this.id = id;
		this.memberId = memberId;
		this.tel = tel;
		this.address = address;
		this.email = email;
		this.statusId = statusId;
		this.status = status;
		this.date = date;
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
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}