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
  <div class="row">
    <div class="col s6 m6">
      <div class="card medium">
        <div class="card-image">
          <img src="https://1.bp.blogspot.com/-TmbR5rqA2e4/V02iginVEoI/AAAAAAACYB0/8x1Ax35MGOIy7p78MfmVVbbFE8EiJykQQCLcB/s1600/novo-Cruze-2017%2B%25281%2529.jpg">
          <span class="card-title">Chevrolet Cruze</span>
        </div>
        <div class="card-content">
          <p>Ar condicionado, vidro elétrico.</p>
          <p>11/06/2017 a 14/06/2017</p>
          <h5>R$ 350,00</h5>
        </div>
        <div class="card-action">
          <a href="#modalComprovante">Comprovante</a>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="modalComprovante" class="modal">
  <div class="modal-content">
    <h4>Comprovante de Aluguel</h4>
    <p>A bunch of text</p>
  </div>
  <div class="modal-footer">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
	  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	  $('.modal').modal();
	});
</script>