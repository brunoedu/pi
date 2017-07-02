package br.com.pi.dominio;

public class Veiculo {
	
	private String placa;
	private String chassi;
	private int ano;
	private String modelo;
	private String marca;
	private String estadoVeiculo;
	private double precoBase;
	private double precoTotal;
	private String foto;
	private String adicionais;
	
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa;
	}
	public String getChassi() {
		return chassi;
	}
	public void setChassi(String chassi) {
		this.chassi = chassi;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getEstadoVeiculo() {
		return estadoVeiculo;
	}
	public void setEstadoVeiculo(String estadoVeiculo) {
		this.estadoVeiculo = estadoVeiculo;
	}
	public double getPrecoBase() {
		return precoBase;
	}
	public void setPrecoBase(double precoBase) {
		this.precoBase = precoBase;
	}
	public double getPrecoTotal() {
		return precoTotal;
	}
	public void setPrecoTotal(double precoTotal) {
		this.precoTotal = precoTotal;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getAdicionais() {
		return adicionais;
	}
	public void setAdicionais(String adicionais) {
		this.adicionais = adicionais;
	}
	public String getObject(){
		return "{\"placa\":\""+getPlaca()+"\","+
			    "\"chassi\":\""+getChassi()+"\","+
			    "\"ano\":"+getAno()+","+
			    "\"modelo\":\""+getModelo()+"\","+
			    "\"marca\":\""+getMarca()+"\","+
			    "\"estadoVeiculo\":\""+getEstadoVeiculo()+"\","+
			    "\"precoBase\":"+getPrecoBase()+","+
			    "\"precoTotal\":"+getPrecoTotal()+","+
			    "\"adicionais\":\""+getAdicionais()+"\"}";
	}

}
