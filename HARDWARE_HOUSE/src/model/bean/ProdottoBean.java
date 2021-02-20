package model.bean;

public class ProdottoBean {

	public ProdottoBean(int codice, String nome, String descrizione, String img_path, double prezzo, 
			String categoria, String venditore) {
		this.codice = codice;
		this.nome = nome;
		this.descrizione = descrizione;
		this.img_path = img_path;
		this.categoria = categoria;
		this.venditore = venditore;
		this.prezzo = prezzo;
	}
	
	public int getCodice() {
		return codice;
	}
	public void setCodice(int codice) {
		this.codice = codice;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getVenditore() {
		return venditore;
	}
	public void setVenditore(String venditore) {
		this.venditore = venditore;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	private int codice;
	private String nome, descrizione, img_path, categoria, venditore;
	private double prezzo;
}
