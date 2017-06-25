
 <h3 class="center-align">Funcionários</h3>
  <div class="row">
    <div class="col s12 m12">
      <div class="card">
        <div class="card-content">
          <table class="striped">
	        <thead>
	          <tr>	          
	              <th>Nome</th>
	              <th>Cargo</th>
	              <th>Cidade</th>
	              <th>Estado</th>
	              <th>Telefone</th>
	              <th>E-mail</th>
	          </tr>
	        </thead>
	
	        <tbody>
	          <tr>
	            <td>Funcionário Nome</td>
	            <td>Vendedor</td>
	            <td>Guaratinguetá</td>
				<td>SP</td>
				<td>(12) 3333-3333</td>
				<td>funcionario@gmail.com</td>
				<td><a href="javascript:excluir()" data-toggle="tooltip" title="Excluir"><i class="material-icons pointer red-text text-darken-1">delete</i></a> </td>
	          </tr>	 
	          <tr>
	            <td>Funcionário Nome</td>
	            <td>Vendedor</td>
	            <td>Guaratinguetá</td>
				<td>SP</td>
				<td>(12) 3333-3333</td>
				<td>funcionario@gmail.com</td>
				<td><a href="javascript:excluir()" data-toggle="tooltip" title="Excluir"><i class="material-icons pointer red-text text-darken-1">delete</i></a> </td>
	          </tr>	
	          <tr>
	            <td>Funcionário Nome</td>
	            <td>Vendedor</td>
	            <td>Guaratinguetá</td>
				<td>SP</td>
				<td>(12) 3333-3333</td>
				<td>funcionario@gmail.com</td>
				<td><a href="javascript:excluir()" data-toggle="tooltip" title="Excluir"><i class="material-icons pointer red-text text-darken-1">delete</i></a> </td>
	          </tr>	         
	        </tbody>
	      </table>
        </div>
      </div>
    </div>
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
			
		}, 2000);
	}
	function excluir(){
		swal({
			  title: 'Excluir funcionário?',
			  text: "Deseja realmente excluir este funcionário?",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Excluir',
			  cancelButtonText: 'Cancelar'
			}).then(function () {
			  swal(
			    'Excluído!',
			    'Funcionário excluído com sucesso.',
			    'success'
			  )
			})
	}
	$(document).ready(function(){
	  
	});
</script>