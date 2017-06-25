 <nav>
   <div class="nav-wrapper cyan lighten-1">
     <div class="col s12">
       <a href="index.jsp?pagina=home" class="breadcrumb">Home</a>
       <a href="#!" class="breadcrumb">Veículos</a>
     </div>
   </div>
 </nav>
<div class="container">
  <h3 class="center-align">Nossos Veículos</h3>
  <div class="row">
    <div class="col s6 m6">
      <div class="card medium">
        <div class="card-image">
          <img src="https://1.bp.blogspot.com/-TmbR5rqA2e4/V02iginVEoI/AAAAAAACYB0/8x1Ax35MGOIy7p78MfmVVbbFE8EiJykQQCLcB/s1600/novo-Cruze-2017%2B%25281%2529.jpg">
          <span class="card-title">Chevrolet Cruze</span>
        </div>
        <div class="card-content">
          <p>Ar condicionado, vidro elétrico.</p>
          <h5>R$ 350,00</h5>
        </div>
        <div class="card-action">
          <a href="#modalAlugar">Alugar Carro</a>
        </div>
      </div>
    </div>
    <div class="col s6 m6">
      <div class="card medium">
        <div class="card-image">
          <img src="https://1.bp.blogspot.com/-TmbR5rqA2e4/V02iginVEoI/AAAAAAACYB0/8x1Ax35MGOIy7p78MfmVVbbFE8EiJykQQCLcB/s1600/novo-Cruze-2017%2B%25281%2529.jpg">
          <span class="card-title">Chevrolet Cruze</span>
        </div>
        <div class="card-content">
          <p>Ar condicionado, vidro elétrico.</p>
          <h5>R$ 350,00</h5>
        </div>
        <div class="card-action">
          <a href="#modalAlugar">Alugar Carro</a>
        </div>
      </div>
    </div>
    <div class="col s6 m6">
      <div class="card medium">
        <div class="card-image">
          <img src="https://1.bp.blogspot.com/-TmbR5rqA2e4/V02iginVEoI/AAAAAAACYB0/8x1Ax35MGOIy7p78MfmVVbbFE8EiJykQQCLcB/s1600/novo-Cruze-2017%2B%25281%2529.jpg">
          <span class="card-title">Chevrolet Cruze</span>
        </div>
        <div class="card-content">
          <p>Ar condicionado, vidro elétrico.</p>
          <h5>R$ 350,00</h5>
        </div>
        <div class="card-action">
          <a href="#modalAlugar">Alugar Carro</a>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="modalAlugar" class="modal">
  <div class="modal-content">
    <h4>Alugar Carro</h4>
	<form class="col s12">      
      <div class="row">
        <div class="input-field col s12">
          <input id="dataRetirada" type="date" class="datepicker">
          <label for="dataRetirada">Data de Retirada</label>
        </div>
      </div>   
      <div class="row">
        <div class="input-field col s12">
          <input id="dataEntrega" type="date" class="datepicker">
          <label for="dataEntrega">Data de Entrega</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>
      </div>
    </form>
  </div>
  <div class="modal-footer">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
  </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
	  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	  $('.modal').modal();
	  $('.datepicker').pickadate({
		    selectMonths: true, // Creates a dropdown to control month
		    selectYears: 15 // Creates a dropdown of 15 years to control year
	  });
	});
</script>