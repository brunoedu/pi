<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%
String email = request.getParameter("email");
String senha = request.getParameter("senha");
String tipo = request.getParameter("tipo");

if(!tipo.equals("a")){
	out.println(PessoaDB.validar(email, senha, tipo));
}else{
	if(email.equals("admin@gmail.com") && senha.equals("123")){
		out.println(true);
	}else{
		out.println(false);
	}
}

%>