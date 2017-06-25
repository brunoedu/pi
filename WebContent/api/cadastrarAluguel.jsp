<%@page import="br.com.pi.persistencia.AluguelDB"%>
<%@page import="br.com.pi.dominio.Aluguel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%

SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
String dataRetiradaReq = request.getParameter("dataNascimento");
Date dataRetirada = format.parse(dataRetiradaReq);

Aluguel aluguel = new Aluguel();
aluguel.setDataRetirada(request.getParameter(dataRetirada));

if(AluguelDB.inserir(aluguel)){
	out.println(false);
}else{
	out.println(true); 
}

%>