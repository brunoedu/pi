<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.persistencia.VeiculoDB"%>
<%

PessoaDB.excluir(request.getParameter("cpf"));
VeiculoDB.excluir(request.getParameter("placa"));


%>