<%@page import="br.com.pi.persistencia.DuvidaDB"%>
<%@page import="br.com.pi.dominio.Duvida"%>
<%@page import="java.util.Date"%>
<%

Duvida duvida = DuvidaDB.getByCodigo(Integer.parseInt(request.getParameter("codigo")));
duvida.setResposta(request.getParameter("resposta"));

Date dataResposta = new Date();
duvida.setDataResposta(dataResposta);

if(DuvidaDB.alterar(duvida)){
	out.println(false);
}else{
	out.println(true); 
}

%>