<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%

PessoaDB.excluir(request.getParameter("cpf"));


%>