package br.com.pi.dominio;

import java.util.Date;

public class Duvida {
	
	private int codigo;
	private String cliente;
	private String pergunta;
	private String resposta;
	private Date dataPergunta;
	private Date dataResposta;

	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public String getPergunta() {
		return pergunta;
	}
	public void setPergunta(String pergunta) {
		this.pergunta = pergunta;
	}
	public String getResposta() {
		return resposta;
	}
	public void setResposta(String resposta) {
		this.resposta = resposta;
	}
	public Date getDataPergunta() {
		return dataPergunta;
	}
	public void setDataPergunta(Date dataPergunta) {
		this.dataPergunta = dataPergunta;
	}
	public Date getDataResposta() {
		return dataResposta;
	}
	public void setDataResposta(Date dataResposta) {
		this.dataResposta = dataResposta;
	}

}
