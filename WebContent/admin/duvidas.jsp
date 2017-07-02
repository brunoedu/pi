<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.persistencia.DuvidaDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%@page import="br.com.pi.dominio.Duvida"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String pagina = request.getParameter("pagina");
	if ((pagina != null) && (pagina.equals("cadastro"))){
	     
	}else if (pagina == null){
	    pagina = "login";
	}
	pagina = pagina + ".jsp";
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	
	ArrayList<Duvida> duvidas = DuvidaDB.listar(); 
   
%>
 <h3 class="center-align">Dúvidas Recebidas</h3>
  <div class="row">
    <div class="col s12 m12">
      <div class="card">
        <div class="card-content">
          <table class="striped">
	        <thead>
	          <tr>	          
	              <th>Cliente</th>
	              <th>Pergunta</th>
	              <th>Resposta</th>
	          </tr>
	        </thead>
	
	        <tbody>
	          <% if (duvidas.size() == 0){ %>
	          	<tr>
	          		<td class="center" colspan="3">Ainda não existem dúvidas recebidas.</td>
	          	</tr>
	          <%} %>  
	          <% for(Duvida duvida:duvidas){
	        	  Pessoa cliente = PessoaDB.getByCpf(duvida.getCliente());
	    	  %>
		          <tr>
		            <td><%=cliente.getNome() %></td>
		            <td><%=duvida.getPergunta() %></td>
		            <%if(duvida.getResposta()!=null){ %>
						<td><%=duvida.getResposta() %></td>
					<%}else{ %>
						<td> - </td>
					<%} %>
					<td><a href="#modalRespDuvida" data-toggle="tooltip" title="Responder" onclick="javascript:setCamposResposta('<%=duvida.getCodigo()%>','<%=duvida.getResposta()%>')"><i class="material-icons pointer cyan-text text-lighten-1">mode_edit</i></a> </td>
		          </tr>	     
	          <% } %>     
	        </tbody>
	      </table>
        </div>
      </div>
    </div>
  </div>
  
<input type="hidden" value="" id="respCodigo"/>
<div id="modalRespDuvida" class="modal">
  <div class="modal-content">
    <h4>Responder Dúvida</h4>  
    <div class="row">
	    <form class="col s12" id="formulario" name="formulario" action="javascript:validar()" method="post">
	      <h5 id="perguntaModal"></h5>
	      <div class="row">
	        <div class="input-field col s12">
	          <textarea id="resposta" name="resposta" class="materialize-textarea"></textarea>
	          <label id="lblResposta" for="resposta">Digite a resposta</label>
	        </div>
	      </div>
	      <div class="row">
		      <button class="btn waves-effect waves-light right cyan lighten-1" type="submit" name="action">Responder
			    <i class="material-icons right">send</i>
			  </button>
	      </div>
	    </form>
  	</div>
  </div>
</div>
<script type="text/javascript">
	function validar(){
		
		var dados = {
			codigo: $('#respCodigo').val(),
			resposta: $('#resposta').val()
		};
		
		console.log(dados);
		
		swal({
			  title: 'Cadastro de Resposta',
			  text: 'Efetuando cadastro de resposta, aguarde um momento!',
			  showConfirmButton: false,
			  allowOutsideClick: false,
			  allowEscapeKey: false,
			  allowEnterKey: false,
			  showLoaderOnConfirm: true
		});
		swal.showLoading();
		
		setTimeout(function(){
			$.ajax({
		           url: "../api/responderDuvida.jsp",
		           data: {		        	   
			   		   codigo: dados.codigo,
			   		   resposta: dados.resposta,
		           },
		           type: "GET",
	               success: function (data) {
	            	   console.log(data);
	                   swal({
	                       title: "Sucesso!",
	                       text: "Resposta cadastrada com sucesso",
	                       type: "success",
	                       allowEscapeKey: false,
	          			   allowOutsideClick: false,
	                   }).then(function () {
		            	   location.href = "../admin/?pagina=duvidas";
	                   });
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Falha ao cadastrar resposta.",
	                       type: "error",
	                   });
	               }
		    });
			
		}, 2000);
	}
	function setCamposResposta(codigo, resposta){
		console.log(codigo);
		//console.log(pergunta);
		console.log(resposta);
		$("textarea[name='resposta']").val("");
		$("#lblResposta").removeClass("active");
		$('#respCodigo').val(codigo);
		//$('#perguntaModal').html(pergunta);
		if(resposta!="null"){
			$("textarea[name='resposta']").val(resposta);
			$("#lblResposta").addClass("active");
		}
	}
	$(document).ready(function(){
		$('.modal').modal();
	});
</script>