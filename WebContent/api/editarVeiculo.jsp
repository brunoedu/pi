<%@page import="br.com.pi.persistencia.VeiculoDB"%>
<%@page import="br.com.pi.dominio.Veiculo"%>
<%

Veiculo veiculo = VeiculoDB.getByPlaca(request.getParameter("placa"));
veiculo.setPlaca(request.getParameter("placa"));
veiculo.setChassi(request.getParameter("chassi"));
veiculo.setAno(Integer.parseInt(request.getParameter("ano")));
veiculo.setModelo(request.getParameter("modelo"));
veiculo.setMarca(request.getParameter("marca"));
veiculo.setEstadoVeiculo(request.getParameter("estadoVeiculo"));
veiculo.setPrecoBase(Double.parseDouble(request.getParameter("precoBase")));
veiculo.setPrecoTotal(Double.parseDouble(request.getParameter("precoTotal")));
veiculo.setAdicionais(request.getParameter("adicionais"));

if(VeiculoDB.alterar(veiculo)){
	out.println(false);
}else{
	out.println(true); 
}

%>