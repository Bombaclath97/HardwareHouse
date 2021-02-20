package model.bean;

import model.dao.UserDAO;

public class AmministratoreBean implements User {
	public AmministratoreBean(String email) {
		this.email = email;
	}

	@Override
	public String getEmail() {
		return email;
	}

	@Override
	public String getPassword() {
		return UserDAO.getPasswordByEmail(this.email);
	}

	@Override
	public String getTipo() {
		return "a";
	}

	@Override
	public void setPassword(String password) {
		UserDAO.setPasswordOfUser(email, password);
	}

	private String email;
}
