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
	          <tr>
	            <td><i class="material-icons">hourglass_empty</i></td>
	            <td>Teste</td>
				<td>Carro</td>
				<td>12/12/2012</td>
				<td>12/12/2012</td>
				<td><i class="material-icons">not_interested</i></td>
				<td>R$ 350,00</td>
				<td><a href="#modalDetalhes" data-toggle="tooltip" title="Detalhes"><i class="material-icons pointer cyan-text text-lighten-1"><i class="material-icons">search</i></i></a> </td>
	          </tr>
	          <tr>
	            <td><i class="material-icons">hourglass_empty</i></td>
	            <td>Teste 2</td>
				<td>Carro 2</td>
				<td>12/12/2012</td>
				<td>12/12/2012</td>
				<td><i class="material-icons">thumb_up</i></td>
				<td>R$ 350,00</td>
				<td><a href="#modalDetalhes" data-toggle="tooltip" title="Detalhes"><i class="material-icons pointer cyan-text text-lighten-1"><i class="material-icons">search</i></i></a> </td>
	          </tr>
	          <tr>
	            <td><i class="material-icons">check_circle</i></td>
	            <td>Teste 3</td>
				<td>Carro 3</td>
				<td>12/12/2012</td>
				<td>12/12/2012</td>
				<td><i class="material-icons">not_interested</i></td>
				<td>R$ 350,00</td>
				<td><a href="#modalDetalhes" data-toggle="tooltip" title="Detalhes"><i class="material-icons pointer cyan-text text-lighten-1"><i class="material-icons">search</i></i></a> </td>
	          </tr>
	        </tbody>
	      </table>
        </div>
      </div>
    </div>
  </div>

<div id="modalDetalhes" class="modal">
  <div class="modal-content">
    <h4>Detalhes do Aluguel</h4>
    <p>Detalhes</p>
  </div>
  <div class="modal-footer">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
  </div>
</div>

<script type="text/javascript">
	function aceitar(){
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
			  swal(
			    'Aceita!',
			    'Reserva aceita com sucesso.',
			    'success'
			  )
			})
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
	});
</script>