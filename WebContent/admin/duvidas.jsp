
 <h3 class="center-align">Dúvidas</h3>
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
	          <tr>
	            <td>Cliente Nome</td>
	            <td>Como alugar um carro?</td>
				<td></td>
				<td><a href="javascript:responder('Como alugar um carro?')" data-toggle="tooltip" title="Responder"><i class="material-icons pointer cyan-text text-lighten-1">mode_edit</i></a> <a href="javascript:excluir()" data-toggle="tooltip" title="Excluir"><i class="material-icons pointer red-text text-darken-1">delete</i></a> </td>
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
		            	   location.href = "../admin/?pagina=veiculos";
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
	function responder(pergunta){
		swal({
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
				          resolve()
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
           	   location.href = "../admin/?pagina=duvidas";
              });
			});
	}
	function excluir(){
		swal({
			  title: 'Excluir pergunta?',
			  text: "Deseja realmente excluir esta pergunta?",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Excluir',
			  cancelButtonText: 'Cancelar'
			}).then(function () {
			  swal(
			    'Excluído!',
			    'Pergunta excluída com sucesso.',
			    'success'
			  )
			})
	}
	$(document).ready(function(){
	  
	});
</script>