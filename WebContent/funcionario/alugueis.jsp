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
	String funcionario = request.getParameter("funcionario");
	String pagina = request.getParameter("pagina");
	if (pagina == null || funcionario == null){ 
	    pagina = "login";
	}
	pagina = pagina + ".jsp";
	
	DecimalFormat df = new DecimalFormat("###.#");
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	
	ArrayList<Aluguel> alugueis = AluguelDB.listar(); 
   
%>
<input id="funcionario" type="hidden" value="<%=funcionario%>"/>
  <h3 class="center-align">Aluguéis Solicitados</h3>
  <div class="row">
    <div class="col s12 m12">
      <div class="card">
        <div class="card-content">
          <table class="striped">
	        <thead>
	          <tr>	          
	              <th>Status</th>
	              <th>Nome</th>
	              <th>Veículo</th>
				  <th>Data Retirada</th>
				  <th>Data Entrega</th>
				  <th>Seguro</th>
				  <th>Valor</th>
	          </tr>
	        </thead>
	
	        <tbody>	
	          <% if (alugueis.size() == 0){ %>
	          	<tr>
	          		<td class="center" colspan="7">Ainda não existem aluguéis solicitados.</td>
	          	</tr>
	          <%} %>        
	          <% 
	          	for(Aluguel aluguel:alugueis){
				  Pessoa cliente = PessoaDB.getByCpf(aluguel.getCliente());
	      		  Veiculo veiculo = VeiculoDB.getByPlaca(aluguel.getVeiculo());
	          %>
	          	<tr>
		            <td>
		            	<%if(aluguel.isStatus()){ %>
		            		<i class="material-icons green-text text-darken-1">check_circle</i>
		            	<%}else{ %>		            		
		            		<a href="javascript:aceitar('<%=aluguel.getCodigo()%>')" data-toggle="tooltip" title="Aceitar"><i class="material-icons pointer red-text text-darken-1">hourglass_empty</i></a>
		            	<%} %>
		            </td>
		            <td><%=cliente.getNome() %></td>
		            <td><%=veiculo.getModelo() %></td>
					<td><%=dateFormat.format(aluguel.getDataRetirada()) %></td>
					<td><%=dateFormat.format(aluguel.getDataEntrega()) %></td>
					<td>
		            	<%if(aluguel.isSeguro()){ %>
		            		<i class="material-icons cyan-text text-lighten-1">thumb_up</i>
		            	<%}else{ %>
		            		<i class="material-icons red-text text-darken-1">not_interested</i>
		            	<%} %>
		            </td>	
		            <td>R$ <%=df.format(aluguel.getPrecoTotal()) %>,00</td>	
		            <td><a href="#modalDetalhes" data-toggle="tooltip" onclick="javascript:setDadosModal('<%=
	        		  veiculo.getModelo()%>', '<%=
	        		  veiculo.getAdicionais()%>', '<%=
	        		  dateFormat.format(aluguel.getDataRetirada())%>', '<%=
	        		  dateFormat.format(aluguel.getDataEntrega())%>', 'R$ <%=
	        		  df.format(aluguel.getPrecoTotal())%>,00', '<%=
	        		  aluguel.isSeguro()%>')" title="Detalhes"><i class="material-icons pointer cyan-text text-lighten-1"><i class="material-icons">search</i></i></a> </td>			
	          	</tr>
	          <%	
	          	}
	          %>	         
	        </tbody>
	      </table>
        </div>
      </div>
    </div>
  </div>
  
  <div id="modalDetalhes" class="modal">
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

<div id="modal" class="modal">
  <div class="modal-content">
    <h4>Detalhes do Aluguel</h4>
    <p>Detalhes</p>
  </div>
  <div class="modal-footer">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
  </div>
</div>

<script type="text/javascript">
	function setDadosModal(modelo, adicionais, dataRetirada, dataEntrada, valor, seguro){
		console.log("Modelos", seguro);
		$('#modeloModal').html(modelo);
		$('#adicionaisModal').html(adicionais);
		$('#dataRetiradaModal').html(dataRetirada);
		$('#dataEntregaModal').html(dataEntrada);
		$('#precoTotalModal').html(valor);
		if(seguro=="true")
			$('#seguroModal').html('<i class="material-icons">thumb_up</i>');
		else
			$('#seguroModal').html('<i class="material-icons">not_interested</i>');
	}
	function aceitar(codigo){
		swal({
			  title: 'Aceitar reserva?',
			  text: "Deseja realmente aceitar esta reserva?",
			  type: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Aceitar',
			  cancelButtonText: 'Cancelar'
			}).then(function () {
				swal({
					  title: 'Aluguel',
					  text: 'Aceitando aluguel, aguarde um momento!',
					  showConfirmButton: false,
					  allowOutsideClick: false,
					  allowEscapeKey: false,
					  allowEnterKey: false,
					  showLoaderOnConfirm: true
				});
				swal.showLoading();
				
				setTimeout(function(){
					$.ajax({
				           url: "../api/aceitarAluguel.jsp",
				           data: {
				        	   codigo: codigo,
				        	   funcionario: $('#funcionario').val(),
				           },
				           type: "GET",
			               success: function (data) {
			            	   console.log(data.trim());
			            	   if(data.trim()=="false"){
				                   swal({
				                       title: "Sucesso!",
				                       text: "Aluguel aceito com sucesso",
				                       type: "success",
				                       allowEscapeKey: false,
				          			   allowOutsideClick: false,
				                   }).then(function () {
					            	   location.href = "../funcionario/?pagina=alugueis&funcionario="+$('#funcionario').val();
				                   });
			            	   }else{
				                   swal({
				                       title: "Erro!",
				                       text: "Falha ao aceitar aluguel.",
				                       type: "error",
				                   });
			            	   }
			               },
			               error: function (data) {
			                   console.log(data);
			                   swal({
			                       title: "Erro!",
			                       text: "Falha ao aceitar aluguel.",
			                       type: "error",
			                   });
			               }
				    });
					
				}, 2000);
			});
	}
	function recusar(){
		swal({
			  title: 'Recusar reserva?',
			  text: "Deseja realmente recusar esta reserva?",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Recusar',
			  cancelButtonText: 'Cancelar'
			}).then(function () {
			  swal(
			    'Recusada!',
			    'Reserva recusada com sucesso.',
			    'success'
			  )
			})
	}
	$(document).ready(function(){
	  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	  $('.modal').modal();
	  $('.materialboxed').materialbox();
	});
</script>