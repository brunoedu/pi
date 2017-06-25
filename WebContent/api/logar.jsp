<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%
String email = request.getParameter("email");
String senha = request.getParameter("senha");
String tipo = request.getParameter("tipo");

if(!tipo.equals("a")){
	String cpf = PessoaDB.validar(email,senha,tipo);

	if (cpf != null){
	    out.println(cpf);
	}else{
	    out.println(false);
	}
}else{
	out.println(true);
}

%>