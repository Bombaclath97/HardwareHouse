package model.bean;

public class PreferitiBean {

	public PreferitiBean(String email, int id) {
		this.email = email;
		this.id = id;
	}

	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	String email;
	int id;
}
