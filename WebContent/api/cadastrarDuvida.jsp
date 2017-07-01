<%@page import="br.com.pi.persistencia.DuvidaDB"%>
<%@page import="br.com.pi.dominio.Duvida"%>
<%@page import="java.util.Date"%>
<%

Duvida duvida = new Duvida();
duvida.setCliente(request.getParameter("cliente"));
duvida.setPergunta(request.getParameter("duvida"));

Date dataPergunta = new Date();
duvida.setDataPergunta(dataPergunta);

if(DuvidaDB.inserir(duvida)){
	out.println(false);
}else{
	out.println(true); 
}

%>