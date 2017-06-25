<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%



Pessoa pessoa = new Pessoa();

SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
String dataNascimentoString = request.getParameter("dataNascimento");
Date dataNascimento = format.parse(dataNascimentoString);

pessoa.setNome(request.getParameter("nome"));
pessoa.setCpf(request.getParameter("cpf"));
pessoa.setCnh(request.getParameter("cnh"));
pessoa.setCargo(request.getParameter("cargo"));
pessoa.setTipo(request.getParameter("tipo"));
pessoa.setRg(request.getParameter("rg"));
pessoa.setTelefone(request.getParameter("telefone"));
pessoa.setDataNascimento(dataNascimento);
pessoa.setLogradouro(request.getParameter("logradouro"));
pessoa.setNumero(request.getParameter("numero"));
pessoa.setCidade(request.getParameter("cidade"));
pessoa.setEstado(request.getParameter("estado"));
pessoa.setCep(request.getParameter("cep"));
pessoa.setEmail(request.getParameter("email"));
pessoa.setSenha(request.getParameter("senha"));

PessoaDB.inserir(pessoa);

out.println(pessoa.getCpf()); 

%>