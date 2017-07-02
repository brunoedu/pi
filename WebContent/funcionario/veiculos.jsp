<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.persistencia.VeiculoDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%@page import="br.com.pi.dominio.Veiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%
	String funcionario = request.getParameter("funcionario");
	String pagina = request.getParameter("pagina");
	if (pagina == null || funcionario == null){ 
	    pagina = "login";
	}
	pagina = pagina + ".jsp";
	
	DecimalFormat df = new DecimalFormat("###.#");
	
	ArrayList<Veiculo> veiculos = VeiculoDB.listarFunc(); 
   
%>
<input id="funcionario" type="hidden" value="<%=funcionario%>"/>
 <h3 class="center-align">Veículos</h3>
  <div class="row">
    <div class="col s12 m12">
      <div class="card">
        <div class="card-content">
         <a class="waves-effect waves-light btn cyan lighten-1" href="#modalNovoVeiculo"><i class="material-icons left">directions_car</i>Novo Veículo</a>
          <table class="striped">
	        <thead>
	          <tr>	          
	              <th>Placa</th>
	              <th>Modelo</th>
	              <th>Marca</th>
	              <th>Ano</th>
	              <th>Chassi</th>
				  <th>Estado</th>
				  <th>Preço Base</th>
				  <th>Preço Total</th>
	          </tr>
	        </thead>
	
	        <tbody>
	          <% if (veiculos.size() == 0){ %>
	          	<tr>
	          		<td class="center" colspan="8">Ainda não existem veículos cadastrados.</td>
	          	</tr>
	          <%} %>  
	          <% 
	          	for(Veiculo veiculo:veiculos){
	          %>
	          	<tr>
		            <td><%=veiculo.getPlaca() %></td>
		            <td><%=veiculo.getModelo() %></td>
		            <td><%=veiculo.getMarca() %></td>
					<td><%=veiculo.getAno() %></td>
					<td><%=veiculo.getChassi() %></td>
					<td><%=veiculo.getEstadoVeiculo() %></td>
					<td>R$ <%=df.format(veiculo.getPrecoBase()) %>,00</td>
					<td>R$ <%=df.format(veiculo.getPrecoTotal()) %>,00</td>
					<td><a href="#" data-toggle="tooltip" onclick="javascript:setModalEditar('<%=veiculo.getPlaca() %>')" title="Editar"><i class="material-icons pointer cyan-text text-lighten-1">mode_edit</i></a> <a href="javascript:excluir('<%=veiculo.getPlaca() %>', '<%=veiculo.getModelo() %>')" data-toggle="tooltip" title="Excluir"><i class="material-icons pointer red-text text-darken-1">delete</i></a> </td>
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


<div id="modalEditarVeiculo" class="modal">
  <div class="modal-content">    
    <h4>Editar Veículo</h4>  
    <div class="row">
	    <form class="col s12" id="formularioEditar" name="formularioEditar" action="javascript:editar()" method="post">
	      <div class="row">
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <input id="placaEditar" name="placaEditar" type="text" class="validate" required>
	          <label id="lblPlacaEditar" for="placaEditar">Placa</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <input id="modeloEditar" name="modeloEditar" type="text" class="validate" required>
	          <label id="lblModeloEditar" for="modeloEditar">Modelo</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <select id="marcaEditar" name="marcaEditar" required>
		        <option value="" disabled selected>Selecione a marca</option>
		        <option value="Volkswagen">Volkswagen</option>
		        <option value="Chevrolet">Chevrolet</option>
		        <option value="Fiat">Fiat</option>
		        <option value="Pegeout">Pegeout</option>
		        <option value="Renault">Renault</option>
		      </select>
	          <label id="lblMarcaEditar" for="marcaEditar">Marca</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">date_range</i>
	          <input id="anoEditar" name="anoEditar" type="text" class="validate" required>
	          <label id="lblAnoEditar" for="anoEditar">Ano</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <input id="chassiEditar" name="chassiEditar" type="text" class="validate" required>
	          <label id="lblChassiEditar" for="chassiEditar">Chassi</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <select id="estadoVeiculoEditar" name="estadoVeiculoEditar" required>
		        <option value="" disabled selected>Selecione o estado do veículo</option>
		        <option value="Em Atividade">Em Atividade</option>
		        <option value="Em Manutenção">Em Manutenção</option>
		      </select>
	          <label id="lblEstadoVeiculoEditar" for="estadoVeiculoEditar">Estado do Veículo</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <select id="adicionaisEditar" name="adicionaisEditar" multiple required>
		        <option value="" disabled selected>Selecione os adicionais</option>
		        <option value="Ar-condicionado">Ar-condicionado</option>
		        <option value="Vidro Elétrico">Vidro Elétrico</option>
		        <option value="Rádio">Rádio</option>
		      </select>
	          <label id="lblAdicionaisEditar" for="adicionaisEditar">Adicionais</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">attach_money</i>
	          <input id="precoBaseEditar" name="precoBaseEditar" type="text" class="validate" required>
	          <label id="lblPrecoBaseEditar" for="precoBaseEditar">Preço Base</label>
	        </div>
	      </div>
	      <div class="row">
		      <button class="btn waves-effect waves-light right cyan lighten-1" type="submit" name="action">Editar
			    <i class="material-icons right">directions_car</i>
			  </button>
	      </div>
	    </form>
  	</div>
  </div>
</div>

<div id="modalNovoVeiculo" class="modal">
  <div class="modal-content">    
    <h4>Novo Veículo</h4>  
    <div class="row">
	    <form class="col s12" id="formulario" name="formulario" action="javascript:validar()" method="post">
	      <div class="row">
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <input id="placa" name="placa" type="text" class="validate" required>
	          <label for="placa">Placa</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <input id="modelo" name="modelo" type="text" class="validate" required>
	          <label for="modelo">Modelo</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <select id="marca" name="marca" required>
		        <option value="" disabled selected>Selecione a marca</option>
		        <option value="Volkswagen">Volkswagen</option>
		        <option value="Chevrolet">Chevrolet</option>
		        <option value="Fiat">Fiat</option>
		        <option value="Pegeout">Pegeout</option>
		        <option value="Renault">Renault</option>
		      </select>
	          <label for="marca">Marca</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">date_range</i>
	          <input id="ano" name="ano" type="text" class="validate" required>
	          <label for="ano">Ano</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <input id="chassi" name="chassi" type="text" class="validate" required>
	          <label for="chassi">Chassi</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <select id="estadoVeiculo" name="estadoVeiculo" required>
		        <option value="" disabled selected>Selecione o estado do veículo</option>
		        <option value="Em Atividade">Em Atividade</option>
		        <option value="Em Manutenção">Em Manutenção</option>
		      </select>
	          <label for="estadoVeiculo">Estado do Veículo</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <select id="adicionais" name="adicionais" multiple required>
		        <option value="" disabled selected>Selecione os adicionais</option>
		        <option value="Ar-condicionado">Ar-condicionado</option>
		        <option value="Vidro Elétrico">Vidro Elétrico</option>
		        <option value="Rádio">Rádio</option>
		      </select>
	          <label for="adicionais">Adicionais</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">attach_money</i>
	          <input id="precoBase" name="precoBase" type="text" class="validate" required>
	          <label for="precoBase">Preço Base</label>
	        </div>
	      </div>
	      <div class="row">
		      <button class="btn waves-effect waves-light right cyan lighten-1" type="submit" name="action">Cadastrar
			    <i class="material-icons right">directions_car</i>
			  </button>
	      </div>
	    </form>
  	</div>
  </div>
</div>
<script type="text/javascript">
	function setModalEditar(placa){
		console.log(placa);
		
		swal({
			  title: 'Editar Veículo',
			  text: 'Carregando dados de veículo, aguarde um momento!',
			  showConfirmButton: false,
			  allowOutsideClick: false,
			  allowEscapeKey: false,
			  allowEnterKey: false,
			  showLoaderOnConfirm: true
		});
		swal.showLoading();
		
		setTimeout(function(){
			$.ajax({
		           url: "../api/objetoVeiculo.jsp",
		           data: {
		        	   placa: placa,
		           },
		           type: "GET",
	               success: function (data) {
	            	   console.log(data.trim());
	            	   var veiculo = JSON.parse(data.trim());
	            	   console.log(veiculo);
	            	   $('#placaEditar').val(veiculo.placa);
	            	   $("#lblPlacaEditar").addClass("active");
	            	   $("#placaEditar").prop("disabled", true);
	            	   $('#modeloEditar').val(veiculo.modelo);
	            	   $("#lblModeloEditar").addClass("active");
	            	   $("select[name='marcaEditar']").val(veiculo.marca);
	            	   $("#marcaEditar").material_select();
	            	   $('#anoEditar').val(veiculo.ano);
	            	   $("#lblAnoEditar").addClass("active");
	            	   $('#chassiEditar').val(veiculo.chassi);
	            	   $("#lblChassiEditar").addClass("active");
	            	   $("select[name='estadoVeiculoEditar']").val(veiculo.estadoVeiculo);
	            	   $("#estadoVeiculoEditar").material_select();
	            	   var adicionais = veiculo.adicionais.split(",");
	            	   for(a of adicionais){	            		   
	            		   //$("select[name='adicionaisEditar']").val(a.trim());
	            		   $("#adicionaisEditar option[value='" + a.trim() + "']").prop("selected", true);
	            	   }
	            	   $("#adicionaisEditar").material_select();
	            	   $('#precoBaseEditar').val(veiculo.precoBase+"00");
	            	   $("#lblPrecoBaseEditar").addClass("active");
	            	   swal.close();	            	   
	            	   $('#modalEditarVeiculo').modal('open');
	            	   
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Falha ao carregar dados de veículo.",
	                       type: "error",
	                   });
	               }
		    });
			
		}, 1000);
		
	}
	
	
	function validar(){
		
		var dados = {
			placa: $('#placa').val(),
			modelo: $('#modelo').val(),
			marca: $('#marca').val(),
			ano: $('#ano').val(),
			chassi: $('#chassi').val(),
			estadoVeiculo: $('#estadoVeiculo').val(),
			precoBase: $('#precoBase').val().slice(0, -2),
			adicionais: '',
			precoTotal: '',
		};
		
		console.log($('#adicionais').val().length);
		
		dados.precoTotal = Number($('#adicionais').val().length) * Number(30) + Number(dados.precoBase);
		
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
			   		   precoTotal: dados.precoTotal,
			   		   adicionais: dados.adicionais,
		           },
		           type: "GET",
	               success: function (data) {
	            	   console.log(data.trim());
	            	   if(data.trim()=="true"){
		                   swal({
		                       title: "Sucesso!",
		                       text: "Veículo cadastrado com sucesso",
		                       type: "success",
		                       allowEscapeKey: false,
		          			   allowOutsideClick: false,
		                   }).then(function () {
			            	   location.href = "../funcionario/?pagina=veiculos&funcionario="+$('#funcionario').val();
		                   });
	            	   }else{
		                   swal({
		                       title: "Erro!",
		                       text: "Falha ao cadastrar veículo.",
		                       type: "error",
		                   });
		                   setMask();
	            	   }
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Falha ao cadastrar veículo.",
	                       type: "error",
	                   });
	                   setMask();
	               }
		    });
			
		}, 2000);
	}
	function excluir(placa, nome){
		
		swal({
			  title: 'Excluir veículo?',
			  text: "Deseja realmente excluir o(a) veículo(a) "+nome+"?",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Excluir',
			  cancelButtonText: 'Cancelar'
			}).then(function () {
				swal({
					  title: 'Excluindo',
					  text: 'Excluindo veículo, aguarde um momento!',
					  showConfirmButton: false,
					  allowOutsideClick: false,
					  allowEscapeKey: false,
					  allowEnterKey: false,
					  showLoaderOnConfirm: true
				});
				swal.showLoading();
				setTimeout(function(){
					$.ajax({
				           url: "../api/excluir.jsp",
				           data: {
					   			placa: placa
				           },
				           type: "GET",
			               success: function (data) {
			            	   console.log(data.trim());
			            	   if(data.trim()=="true"){
				                   swal({
				                       title: "Excluído!",
				                       text: "Veículo excluído com sucesso",
				                       type: "success",
				                       allowEscapeKey: false,
				          			   allowOutsideClick: false,
				                   }).then(function () {
					            	   location.href = "../funcionario/?pagina=veiculos&funcionario="+$('#funcionario').val();
				                   });
			               	   }else{
				                   swal({
				                       title: "Erro!",
				                       text: "Falha ao excluir veículo, pois, ele está relacionado a um aluguel no momento.",
				                       type: "error",
				                   });
			               	   }
			               },
			               error: function (data) {
			                   console.log(data);
			                   swal({
			                       title: "Erro!",
			                       text: "Falha ao excluir veículo.",
			                       type: "error",
			                   });
			               }
				    });
					
				}, 2000);
			})
	}
	
	function editar(){
		
		var dados = {
			placa: $('#placaEditar').val(),
			modelo: $('#modeloEditar').val(),
			marca: $('#marcaEditar').val(),
			ano: $('#anoEditar').val(),
			chassi: $('#chassiEditar').val(),
			estadoVeiculo: $('#estadoVeiculoEditar').val(),
			precoBase: $('#precoBaseEditar').val().slice(0, -2),
			adicionais: '',
			precoTotal: '',
		};
		
		console.log($('#adicionaisEditar').val().length);
		
		dados.precoTotal = Number($('#adicionaisEditar').val().length) * Number(30) + Number(dados.precoBase);
		
		$('#adicionaisEditar').val().forEach(function(adicional) {
		    dados.adicionais += adicional+", ";
		});
		
		dados.adicionais = dados.adicionais.slice(0, -2);
		
		console.log(dados);
		
		swal({
			  title: 'Edição de Veículo',
			  text: 'Efetuando edição, aguarde um momento!',
			  showConfirmButton: false,
			  allowOutsideClick: false,
			  allowEscapeKey: false,
			  allowEnterKey: false,
			  showLoaderOnConfirm: true
		});
		swal.showLoading();
		
		setTimeout(function(){
			$.ajax({
		           url: "../api/editarVeiculo.jsp",
		           data: {
		        	   placa: dados.placa,
			   		   modelo: dados.modelo,
			   		   marca: dados.marca,
			   		   ano: dados.ano,
			   		   chassi: dados.chassi,
			   		   estadoVeiculo: dados.estadoVeiculo,
			   		   precoBase: dados.precoBase,
			   		   precoTotal: dados.precoTotal,
			   		   adicionais: dados.adicionais,
		           },
		           type: "GET",
	               success: function (data) {
	            	   console.log(data.trim());
	            	   if(data.trim()=="true"){
		                   swal({
		                       title: "Sucesso!",
		                       text: "Veículo editado com sucesso",
		                       type: "success",
		                       allowEscapeKey: false,
		          			   allowOutsideClick: false,
		                   }).then(function () {
			            	   location.href = "../funcionario/?pagina=veiculos&funcionario="+$('#funcionario').val();
		                   });
	            	   }else{
		                   swal({
		                       title: "Erro!",
		                       text: "Falha ao editar veículo.",
		                       type: "error",
		                   });
		                   setMask();
	            	   }
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Falha ao editar veículo.",
	                       type: "error",
	                   });
	                   setMask();
	               }
		    });
			
		}, 2000);
	}
	
	function setMask(){
		  $('#placa').inputmask({
			  mask:"***-9999",
			  showMaskOnHover: false,
			  showMaskOnFocus: false,
			  clearMaskOnLostFocus: true,
			  removeMaskOnSubmit: true,
	  		  clearIncomplete: true,
		  });
		  $('#ano').inputmask({
			  mask:"9999",
			  showMaskOnHover: false,
			  showMaskOnFocus: false,
			  clearMaskOnLostFocus: true,
			  removeMaskOnSubmit: true,
	  		  clearIncomplete: true,
		  });
		  $('#precoBase').inputmask({
			  mask:"R$ 999,99",
			  showMaskOnHover: false,
			  showMaskOnFocus: false,
			  clearMaskOnLostFocus: true,
			  removeMaskOnSubmit: true,
	  		  clearIncomplete: true,
		  });
		  
		  $('#placaEditar').inputmask({
			  mask:"***-9999",
			  showMaskOnHover: false,
			  showMaskOnFocus: false,
			  clearMaskOnLostFocus: true,
			  removeMaskOnSubmit: true,
	  		  clearIncomplete: true,
		  });
		  $('#anoEditar').inputmask({
			  mask:"9999",
			  showMaskOnHover: false,
			  showMaskOnFocus: false,
			  clearMaskOnLostFocus: true,
			  removeMaskOnSubmit: true,
	  		  clearIncomplete: true,
		  });
		  $('#precoBaseEditar').inputmask({
			  mask:"R$ 999,99",
			  showMaskOnHover: false,
			  showMaskOnFocus: false,
			  clearMaskOnLostFocus: true,
			  removeMaskOnSubmit: true,
	  		  clearIncomplete: true,
		  });
	}
	$(document).ready(function(){
	  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	  $('.modal').modal();
	  $('select').material_select();	  
	  setMask();
	});
</script>