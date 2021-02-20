package model.bean;

//TIPO E EMAIL SONO READ-ONLY
public interface User {
	public String getEmail();
	public String getPassword();
	public String getTipo();
	
	public void setPassword(String password);
}
