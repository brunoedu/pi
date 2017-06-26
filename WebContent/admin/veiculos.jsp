<%@page import="br.com.pi.persistencia.VeiculoDB"%>
<%@page import="br.com.pi.dominio.Veiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%
	String pagina = request.getParameter("pagina");
	if (pagina == null){ 
	    pagina = "login";
	}
	pagina = pagina + ".jsp";
	
	DecimalFormat df = new DecimalFormat("###.#");
	
	ArrayList<Veiculo> veiculos = VeiculoDB.listar(); 
   
%>
 <h3 class="center-align">Ve�culos</h3>
  <div class="row">
    <div class="col s12 m12">
      <div class="card">
        <div class="card-content">
         <a class="waves-effect waves-light btn cyan lighten-1" href="#modalNovoVeiculo"><i class="material-icons left">directions_car</i>Novo Ve�culo</a>
          <table class="striped">
	        <thead>
	          <tr>	          
	              <th>Placa</th>
	              <th>Modelo</th>
	              <th>Marca</th>
	              <th>Ano</th>
	              <th>Chassi</th>
				  <th>Estado</th>
				  <th>Pre�o Base</th>
				  <th>Pre�o Total</th>
	          </tr>
	        </thead>
	
	        <tbody>
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
					<td><a href="#modalEditar" data-toggle="tooltip" title="Editar"><i class="material-icons pointer cyan-text text-lighten-1">mode_edit</i></a> <a href="javascript:excluir('<%=veiculo.getPlaca() %>', '<%=veiculo.getModelo() %>')" data-toggle="tooltip" title="Excluir"><i class="material-icons pointer red-text text-darken-1">delete</i></a> </td>
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

<div id="modalEditar" class="modal">
  <div class="modal-content">
    <h4>Edi��o de Ve�culo</h4>
    <p>Editar ve�culo</p>
  </div>
  <div class="modal-footer">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
  </div>
</div>

<div id="modalNovoVeiculo" class="modal">
  <div class="modal-content">    
    <h4>Novo Ve�culo</h4>  
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
		        <option value="" disabled selected>Selecione o estado do ve�culo</option>
		        <option value="Em Atividade">Em Atividade</option>
		        <option value="Em Manuten��o">Em Manuten��o</option>
		      </select>
	          <label for="estadoVeiculo">Estado do Ve�culo</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">directions_car</i>
	          <select id="adicionais" name="adicionais" multiple required>
		        <option value="" disabled selected>Selecione os adicionais</option>
		        <option value="Ar-condicionado">Ar-condicionado</option>
		        <option value="Vidro El�trico">Vidro El�trico</option>
		        <option value="R�dio">R�dio</option>
		      </select>
	          <label for="adicionais">Adicionais</label>
	        </div>
	        <div class="input-field col s6">
	          <i class="material-icons prefix">attach_money</i>
	          <input id="precoBase" name="precoBase" type="text" class="validate" required>
	          <label for="precoBase">Pre�o Base</label>
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
  <!-- <div class="modal-footer">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
  </div> -->
</div>
<script type="text/javascript">
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
			  title: 'Cadastro de Ve�culo',
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
		                       text: "Ve�culo cadastrado com sucesso",
		                       type: "success",
		                       allowEscapeKey: false,
		          			   allowOutsideClick: false,
		                   }).then(function () {
			            	   location.href = "../admin/?pagina=veiculos";
		                   });
	            	   }else{
		                   swal({
		                       title: "Erro!",
		                       text: "Falha ao cadastrar ve�culo.",
		                       type: "error",
		                   });
		                   setMask();
	            	   }
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Falha ao cadastrar ve�culo.",
	                       type: "error",
	                   });
	                   setMask();
	               }
		    });
			
		}, 2000);
	}
	function excluir(placa, nome){
		
		swal({
			  title: 'Excluir ve�culo?',
			  text: "Deseja realmente excluir o(a) ve�culo(a) "+nome+"?",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Excluir',
			  cancelButtonText: 'Cancelar'
			}).then(function () {
				swal({
					  title: 'Excluindo',
					  text: 'Excluindo ve�culo, aguarde um momento!',
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
			                   swal({
			                       title: "Exclu�do!",
			                       text: "Ve�culo exclu�do com sucesso",
			                       type: "success",
			                       allowEscapeKey: false,
			          			   allowOutsideClick: false,
			                   }).then(function () {
				            	   location.href = "../admin/?pagina=veiculos";
			                   });
			               },
			               error: function (data) {
			                   console.log(data);
			                   swal({
			                       title: "Erro!",
			                       text: "Falha ao excluir funcion�rio.",
			                       type: "error",
			                   });
			               }
				    });
					
				}, 2000);
			})
	} 
	
	function setMask(){
		  $('#placa').inputmask({
			  mask:"***-9999",
			  showMaskOnHover: false,
			  showMaskOnFocus: false,
			  clearMaskOnLostFocus: true,
			  removeMaskOnSubmit: true,
		  });
		  $('#ano').inputmask({
			  mask:"9999",
			  showMaskOnHover: false,
			  showMaskOnFocus: false,
			  clearMaskOnLostFocus: true,
			  removeMaskOnSubmit: true,
		  });
		  $('#precoBase').inputmask({
			  mask:"R$ 999,99",
			  showMaskOnHover: false,
			  showMaskOnFocus: false,
			  clearMaskOnLostFocus: true,
			  removeMaskOnSubmit: true,
		  });
	}
	$(document).ready(function(){
	  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	  $('.modal').modal();
	  $('select').material_select();	  
	  setMask();
	});
</script>