<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.persistencia.AluguelDB"%>
<%@page import="br.com.pi.persistencia.VeiculoDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%@page import="br.com.pi.dominio.Aluguel"%>
<%@page import="br.com.pi.dominio.Veiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String usuario = request.getParameter("usuario");
	String pagina = request.getParameter("pagina");
	if ((pagina != null) && (pagina.equals("cadastro"))){
	     
	}else if (pagina == null || usuario == null){
	    pagina = "login";
	}
	pagina = pagina + ".jsp";
	
	DecimalFormat df = new DecimalFormat("###.#");
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	
	ArrayList<Aluguel> alugueis = AluguelDB.getByCliente(usuario); 
   
%>
 <nav>
   <div class="nav-wrapper cyan lighten-1">
     <div class="col s12">
       <a href="index.jsp?pagina=home" class="breadcrumb">Home</a>
       <a href="#!" class="breadcrumb">Meus Aluguéis</a>
     </div>
   </div>
 </nav>
<div class="container">
  <h3 class="center-align">Meus Aluguéis</h3>
  <% if (alugueis.size() == 0){ %>
  <div class="row center">
     <div class="col s12 m12">
       <div class="card">
         <div class="card-content">
           <p>Você ainda não possui aluguéis ativos.</p>
         </div>
       </div>
     </div>
   </div>
   <%} %>
  <div class="row">
    <% 
	  for(Aluguel aluguel:alugueis){
		  Veiculo veiculo = VeiculoDB.getByPlaca(aluguel.getVeiculo());
	%>
    <div class="col s6 m6">
      <div class="card medium">
        <div class="card-image">
          <img src="../res/img/carro1.jpg">
          <span class="card-title"><%=veiculo.getModelo() %></span>
        </div>
        <div class="card-content">
          <p><%=veiculo.getAdicionais() %>.</p>
          <p><%=dateFormat.format(aluguel.getDataRetirada()) %> a <%=dateFormat.format(aluguel.getDataEntrega()) %></p>
          <h5>R$ <%=df.format(aluguel.getPrecoTotal()) %>,00</h5>
        </div>
        <div class="card-action">
          <a href="#modalComprovante" class="pointer" onclick="javascript:setDadosModal('<%=
        		  veiculo.getModelo()%>', '<%=
        		  veiculo.getAdicionais()%>', '<%=
        		  dateFormat.format(aluguel.getDataRetirada())%>', '<%=
        		  dateFormat.format(aluguel.getDataEntrega())%>', 'R$ <%=
        		  df.format(aluguel.getPrecoTotal())%>,00', '<%=
        		  aluguel.isSeguro()%>')">
          	<%if(!aluguel.isStatus()){ %><i class="material-icons">hourglass_empty</i><%} %>
          	<%if(aluguel.isStatus()){ %><i class="material-icons">check_circle</i><%} %>Comprovante</a>
        </div>
      </div>
    </div>
    <%	
   		}
    %>
  </div>
</div>

<div id="modalComprovante" class="modal">
  <div class="modal-content">
    <h4>Comprovante de Aluguel</h4>
    <div class="row">
	    <div class="col s6 m6">
		    <strong>Veículo:</strong> <span id="modeloModal"></span><br/>
		    <strong>Adicionais:</strong> <span id="adicionaisModal">Teste</span><br/>
		    <strong>Seguro:</strong> <span id="seguroModal"></span><br/>
		    <strong>Data Retirada:</strong> <span id="dataRetiradaModal"></span><br/>
		    <strong>Data Entrega:</strong> <span id="dataEntregaModal"></span><br/>
		    <strong>Valor:</strong> <span id="precoTotalModal"></span><br/>    
	    </div>
	    <div class="col s6 m6">
			<img class="materialboxed" width="250" src="../res/img/carro1.jpg">    
	    </div>    
    </div>
  </div>
  <div class="modal-footer">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
  </div>
</div>

<script type="text/javascript">
	function setDadosModal(modelo, adicionais, dataRetirada, dataEntrada, valor, seguro){
		console.log("Modelos", modelo);
		$('#modeloModal').html(modelo);
		$('#adicionaisModal').html(adicionais);
		$('#dataRetiradaModal').html(dataRetirada);
		$('#dataEntregaModal').html(dataEntrada);
		$('#precoTotalModal').html(valor);
		if(seguro)
			$('#seguroModal').html('<i class="material-icons">thumb_up</i>');
		else
			$('#seguroModal').html('<i class="material-icons">not_interested</i>');
	}
	$(document).ready(function(){
	  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	  $('.modal').modal();
	  $('.materialboxed').materialbox();
	});
</script>