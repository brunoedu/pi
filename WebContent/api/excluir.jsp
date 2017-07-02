<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.persistencia.VeiculoDB"%>
<%

if(request.getParameter("cpf")!=null){
	out.println(PessoaDB.excluir(request.getParameter("cpf")));
}

if(request.getParameter("placa")!=null){
	out.println(VeiculoDB.excluir(request.getParameter("placa")));
}


%>