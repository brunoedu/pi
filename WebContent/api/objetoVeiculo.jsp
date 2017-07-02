<%@page import="br.com.pi.persistencia.VeiculoDB"%>
<%@page import="br.com.pi.dominio.Veiculo"%>
<%

Veiculo veiculo = VeiculoDB.getByPlaca(request.getParameter("placa"));

out.println(veiculo.getObject());

%>