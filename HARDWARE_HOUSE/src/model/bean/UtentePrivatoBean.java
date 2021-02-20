package model.bean;

import java.time.LocalDate;

import model.dao.UserDAO;
import model.dao.UtentePrivatoDAO;

public class UtentePrivatoBean implements User {
	public UtentePrivatoBean(String email, String nome, String cognome, LocalDate compleanno) {
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.compleanno = compleanno;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
		UtentePrivatoDAO.updateNome(nome, this.email);
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
		UtentePrivatoDAO.updateCognome(cognome, this.email);
	}

	public LocalDate getCompleanno() {
		return compleanno;
	}

	public void setCompleanno(LocalDate compleanno) {
		this.compleanno = compleanno;
		UtentePrivatoDAO.updateCompleanno(compleanno, this.email);
	}

	@Override
	public String getEmail() {
		return email;
	}

	@Override
	public String getTipo() {
		return "p";
	}
	
	@Override
	public String getPassword() {
		return UserDAO.getPasswordByEmail(this.email);
	}

	@Override
	public void setPassword(String password) {
		UserDAO.setPasswordOfUser(this.email, password);
	}

	
	private String email, nome, cognome;
	private LocalDate compleanno;
	
}
