<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.persistencia.DuvidaDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%@page import="br.com.pi.dominio.Duvida"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String funcionario = request.getParameter("funcionario");
	String pagina = request.getParameter("pagina");
	if (pagina == null || funcionario == null){ 
	    pagina = "login";
	}
	pagina = pagina + ".jsp";
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	
	ArrayList<Duvida> duvidas = DuvidaDB.listar(); 
   
%>
<input id="funcionario" type="hidden" value="<%=funcionario%>"/>
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
					<td><a href="#modalRespDuvida" data-toggle="tooltip" title="Responder" onclick="javascript:setCamposResposta('<%=
					duvida.getCodigo() %>','<%=
					duvida.getPergunta() %>','<%=
					duvida.getResposta() %>')"><i class="material-icons pointer cyan-text text-lighten-1">mode_edit</i></a> </td>
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
	          <textarea id="resposta" class="materialize-textarea"></textarea>
	          <label for="resposta">Digite a resposta</label>
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
		
		/* var dados = {
			placa: $('#placa').val(),
			modelo: $('#modelo').val(),
			marca: $('#marca').val(),
			ano: $('#ano').val(),
			chassi: $('#chassi').val(),
			estadoVeiculo: $('#estadoVeiculo').val(),
			precoBase: $('#precoBase').val(),
			adicionais: '',
		};
		
		$('#adicionais').val().forEach(function(adicional) {
		    dados.adicionais += adicional+", ";
		});
		
		dados.adicionais = dados.adicionais.slice(0, -2);
		
		console.log(dados);
		
		swal({
			  title: 'Cadastro de Veículo',
			  text: 'Efetuando cadastro, aguarde um momento!',
			  showConfirmButton: false,
			  allowOutsideClick: false,
			  allowEscapeKey: false,
			  allowEnterKey: false,
			  showLoaderOnConfirm: true
		});
		swal.showLoading();
		
		setTimeout(function(){
			$.ajax({
		           url: "../api/cadastrarVeiculo.jsp",
		           data: {
		        	   placa: dados.placa,
			   		   modelo: dados.modelo,
			   		   marca: dados.marca,
			   		   ano: dados.ano,
			   		   chassi: dados.chassi,
			   		   estadoVeiculo: dados.estadoVeiculo,
			   		   precoBase: dados.precoBase,
			   		   adicionais: dados.adicionais,
		           },
		           type: "GET",
	               success: function (data) {
	            	   console.log(data);
	                   swal({
	                       title: "Sucesso!",
	                       text: "Veículo cadastrado com sucesso",
	                       type: "success",
	                       allowEscapeKey: false,
	          			   allowOutsideClick: false,
	                   }).then(function () {
		            	   location.href = "../funcionario/?pagina=veiculos&funcionario="+$('#funcionario').val();
	                   });
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Falha ao cadastrar veículo.",
	                       type: "error",
	                   });
	               }
		    });
			
		}, 2000); */
	}
	function setCamposResposta(codigo, pergunta, resposta){
		console.log(codigo);
		console.log(pergunta);
		console.log(resposta);
		$('#respCodigo').val(codigo);
		$('#perguntaModal').html(pergunta);
		if(resposta!=null)
			$('#reposta').val(resposta);
		/* swal({
			  title: pergunta,
			  input: 'textarea',
			  showCancelButton: true,
			  confirmButtonText: 'Responder',
			  cancelButtonText: 'Cancelar',
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  showLoaderOnConfirm: true,
			  preConfirm: function (resposta) {
			    return new Promise(function (resolve, reject) {
			    	setTimeout(function() {
				        if (resposta === '' || resposta == null) {
				          reject('Preencha corretamente a resposta.')
				        } else {
				          resolve();
				        }
				    }, 2000)
			    })
			  },
			  allowOutsideClick: false,
              allowEscapeKey: false,
			}).then(function (resposta) {			
			  swal({
                  title: "Sucesso!",
                  text: "Pergunta respondida com sucesso",
                  type: "success",
                  allowEscapeKey: false,
     			   allowOutsideClick: false,
              }).then(function () {
           	   location.href = "../funcionario/?pagina=duvidas&funcionario="+$('#funcionario').val();
              });
			}); */
	}
	$(document).ready(function(){
		$('.modal').modal();
	});
</script>