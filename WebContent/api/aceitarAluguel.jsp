<%@page import="br.com.pi.persistencia.AluguelDB"%>
<%@page import="br.com.pi.dominio.Aluguel"%>
<%

Aluguel aluguel = AluguelDB.getByCodigo(Integer.parseInt(request.getParameter("codigo")));
aluguel.setStatus(true);

if(AluguelDB.alterar(aluguel)){
	out.println(false);
}else{
	out.println(true); 
}

%>