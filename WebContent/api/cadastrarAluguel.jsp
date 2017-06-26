<%@page import="br.com.pi.persistencia.AluguelDB"%>
<%@page import="br.com.pi.dominio.Aluguel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%

SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
String dataRetiradaReq = request.getParameter("dataRetirada");
Date dataRetirada = format.parse(dataRetiradaReq);
String dataEntregaReq = request.getParameter("dataEntrega");
Date dataEntrega = format.parse(dataEntregaReq);

boolean seguro = request.getParameter("seguro").equals("true")?true:false;

Aluguel aluguel = new Aluguel();
aluguel.setCliente(request.getParameter("cliente"));
aluguel.setFuncionario(request.getParameter("funcionario"));
aluguel.setVeiculo(request.getParameter("veiculo"));
aluguel.setDataRetirada(dataRetirada);
aluguel.setDataEntrega(dataEntrega);
aluguel.setSeguro(seguro);
aluguel.setPrecoTotal(Double.parseDouble(request.getParameter("precoTotal")));
aluguel.setStatus(true);

if(AluguelDB.inserir(aluguel)){
	out.println(false);
}else{
	out.println(true); 
}

%>